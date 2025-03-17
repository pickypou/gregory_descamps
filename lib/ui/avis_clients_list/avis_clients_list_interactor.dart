
import 'package:flutter/material.dart';

import '../../core/di/di.dart';
import '../../data/repository/avis_clients_repository.dart';
import '../../domaine/entity/avis_clients.dart';
import '../../domaine/usecases/fetch_avis_clients_data_usecase.dart';

class AvisClientsListInteractor {
  final fetchAvisClientsList = getIt<FetchAvisClientDataUseCase>();
  final avisClientList = getIt<AvisClientsRepository>();

  AvisClientsListInteractor();

  Future<Iterable<AvisClients>> fetchAvisClientData() async {
    try {
      final avisClients = await fetchAvisClientsList.getAvisClients();
      return avisClients;
    } catch (e) {
      debugPrint(' récupération de l\'avis');
      rethrow;
    }
  }

  Future<AvisClients?> getById(String avisClientsId) async {
    try {
      return await fetchAvisClientsList.getAvisClientsById(avisClientsId);
    } catch (e) {
      debugPrint('Erreur lors de la récupération de l\'avis par ID : $e');
      rethrow;
    }
  }

  Future<void> removeAvisClient(String avisClientsId) async {
    try {
      await avisClientList.deleteAvisClients(
        avisClientsId,
      );
      debugPrint('avis supprimé : $avisClientsId');
    } catch (e) {
      debugPrint('Erreur lors de la suppression de l\'avis : $e');
      rethrow;
    }
  }
}