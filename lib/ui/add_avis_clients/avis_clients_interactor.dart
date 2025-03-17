import 'package:flutter/material.dart';

import '../../data/repository/avis_clients_repository.dart';
import '../../domaine/entity/avis_clients.dart';
import '../../domaine/usecases/fetch_avis_clients_data_usecase.dart';





class AvisClientsInteractor {
  final FetchAvisClientDataUseCase fetchAvisClientDataUseCase;
  final AvisClientsRepository avisClientsRepository;

  AvisClientsInteractor(
      this.avisClientsRepository, this.fetchAvisClientDataUseCase
      );
  Future<Iterable<AvisClients>> fetchAvisClientsData() async {
    try {
      final avisClients = await fetchAvisClientDataUseCase.getAvisClients();
      return avisClients;
    }catch(e) {
      debugPrint('Erreur lors du récupération des avis clients : $e');
      rethrow;
    }
  }
  Future<void> addAvisClients(AvisClients avisClients) async {
    try {
      await avisClientsRepository.add({
        'categories': avisClients.firstname,
        'text': avisClients.text,
        'publishDate': avisClients.publishDate
      });
    } catch (error) {
      debugPrint('Erreur lors de l\'ajout de l\'avis du client: $error');
      rethrow;
    }
  }

}