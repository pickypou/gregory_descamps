import '../../domaine/entity/avis_clients.dart';

abstract class AvisClientsState {}

class AvisClientsInitial extends AvisClientsState {}

// État initial, indique que le chargement est en cours
class AvisClientsLoadingState extends AvisClientsState {}

// État lorsque la liste d'avis clients est chargée avec succès
class AvisClientsLoadedState extends AvisClientsState {
  final List<AvisClients> avisClientsData;

  AvisClientsLoadedState({required this.avisClientsData});
}

// État lorsque le chargement d'un avis client spécifique est réussi
class AvisClientDetailLoadedState extends AvisClientsState {
  final AvisClients avisClientDetail;

  AvisClientDetailLoadedState({required this.avisClientDetail});
}

class AddAvisClientsSignUpSuccessState extends AvisClientsState {
  final String addAvisClientsId;
  AddAvisClientsSignUpSuccessState({required this.addAvisClientsId});
}

// État lorsqu'une erreur survient
class AvisClientsErrorState extends AvisClientsState {
  final String message;

  AvisClientsErrorState({required this.message});
}
