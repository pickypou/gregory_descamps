import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../domaine/entity/avis_clients.dart';
import 'avis_clients_interactor.dart';
import 'avis_clients_event.dart';
import 'avis_clients_state.dart';

class AddAvisClientsBloc
    extends Bloc<AddAvisClientsEvent, AddAvisClientsState> {
  final AvisClientsInteractor avisClientsInteractor;

  AddAvisClientsBloc(this.avisClientsInteractor)
      : super(AddAvisClientsSignUpInitialState()) {
    on<AddAvisClientsEvent>((event, emit) async {
      if (event is AddAvisClientsSignUpEvent) {
        emit(AddAvisClientsSignUpLoadingState());
        try {
          debugPrint('publishDate avant conversion: ${event.publishDate}');



          final avisClients = AvisClients(
              id: event.id,
              firstname: event.firstname,
              text: event.text,
              publishDate: event.publishDate);
          await avisClientsInteractor.addAvisClients(avisClients);
          emit(AddAvisClientsSignUpSuccessState(addAvisClientsId: event.id));
        } catch (error) {
          emit(AddAvisClientsSignUpErrorState(error.toString()));
        }
      }
    });
  }
}