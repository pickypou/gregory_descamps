import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../core/api/firestore_service.dart';
import '../../domaine/entity/avis_clients.dart';
import 'avis_clients_repository.dart';

@Injectable(as: AvisClientsRepository)
class AvisClientsRepositoryImpl extends AvisClientsRepository {
  final FirestoreService _firestore;

  AvisClientsRepositoryImpl(this._firestore);

  @override
  Stream<Iterable<AvisClients>> getAvisClientsStream() {
    return _firestore.collection('avis_clients').snapshots().map((
      querySnapshot,
    ) {
      return querySnapshot.docs
          .map((doc) {
            final data = doc.data();
            if (data == null) {
              return null; // Ignore les documents vides
            }
            return AvisClients.fromMap(data as Map<String, dynamic>, doc.id);
          })
          .whereType<AvisClients>()
          .toList();
    });
  }

  @override
  Future<Map<String, dynamic>> getById(String avisClientsId) async {
    final docSnapshot =
        await _firestore.collection('avis_clients').doc(avisClientsId).get();
    final data = docSnapshot.data();
    if (data == null) {
      throw Exception('Aucun avis trouvé avec l\'ID : $avisClientsId');
    }
    return data as Map<String, dynamic>;
  }

  @override
  Future<void> add(Map<String, dynamic> data) async {
    await _firestore.collection('avis_clients').add(data);
  }

  @override
  Future<void> deleteAvisClients(String avisClientsId) async {
    try {
      // Supprime uniquement le document spécifique dans Firestore
      await _firestore.collection('avis_clients').doc(avisClientsId).delete();
      debugPrint('Avis supprimé avec succès : $avisClientsId');
    } catch (e) {
      debugPrint('Erreur lors de la suppression de l\'avis : $e');
      rethrow; // Vous pouvez choisir de gérer l'erreur différemment si nécessaire
    }
  }

  @override
  Future<void> updateField(
    String avisClientsId,
    String fieldName,
    String newValue,
  ) async {
    await _firestore.collection('avis_clients').doc(avisClientsId).update({
      fieldName: newValue,
    });
  }
}
