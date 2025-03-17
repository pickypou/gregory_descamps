import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../theme.dart';
import '../../common/custom_buttom.dart';
import '../../common/custom_text_field.dart';
import '../avis_clients_bloc.dart';
import '../avis_clients_event.dart';
import '../avis_clients_state.dart';

class AddAvisClientsView extends StatelessWidget {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController publishDateController = TextEditingController();

  AddAvisClientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAvisClientsBloc, AddAvisClientsState>(
      builder: (context, state) {
        if (state is AddAvisClientsSignUpLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AddAvisClientsSignUpErrorState) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is AddAvisClientsSignUpSuccessState) {
          return _buildForm(context, state.addAvisClientsId);
        } else {
          return _buildForm(context, '');
        }
      },
    );
  }

  Widget _buildForm(BuildContext context, String adherentId) {
    final auth = GetIt.instance<FirebaseAuth>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('J\'ajoute un avis'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/account'); // Revenir à la page précédente
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              auth.signOut().then((_) {
                debugPrint('Déconnexion réussie');
                context.go('/');
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Ajouter un commentaire',
                style: titleStyleLarge(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 40.0,
                runSpacing: 20.0,
                children: [
                  CustomTextField(
                    labelText: 'Titre',
                    controller: firstnameController,
                    maxLines: 1,
                  ),
                  const SizedBox(width: 40),
                  CustomTextField(
                    labelText: 'Date du jour (dd/MM/yyyy)',
                    controller: publishDateController,
                    maxLines: 1,
                  ),
                  CustomTextField(
                    labelText: 'Mon commentaire',
                    controller: textController,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      try {
                        DateFormat format = DateFormat('dd/MM/yyyy');
                        DateTime publishDate = format.parse(
                          publishDateController.text,
                        );

                        context.read<AddAvisClientsBloc>().add(
                          AddAvisClientsSignUpEvent(
                            id: 'someId', // Remplacez par un vrai ID si nécessaire
                            firstname: firstnameController.text,
                            text: textController.text,
                            publishDate: publishDate,
                            navigateToAccount:
                                () => GoRouter.of(context).go('/account'),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Erreur de format de date : $e'),
                          ),
                        );
                        debugPrint('Erreur de format de date : $e');
                      }
                    },
                    label: 'Je poste mon avis',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
