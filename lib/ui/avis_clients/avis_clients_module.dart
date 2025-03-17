import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gregory_descamps/ui/avis_clients/view/avis_client_view.dart';
import 'package:injectable/injectable.dart';

import '../../core/di/di.dart';
import '../ui_module.dart';
import 'avis_clients_bloc.dart';
import 'avis_clients_interactor.dart';

@singleton
class AvisClientsModule implements UIModule {
  final AppRouter _appRouter;

  AvisClientsModule(this._appRouter);

  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }

  @override
  List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: '/AvisClients',
        pageBuilder: (context, state) {
          return MaterialPage(child: _buildAddAvisClients());
        },
      ),
    ];
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    return {};
  }

  Widget _buildAddAvisClients() {
    // Récupérer l'interactor via GetIt
    final interactor = getIt<AvisClientsInteractor>();

    return BlocProvider<AvisClientsBloc>(
      create:
          (context) => AvisClientsBloc(interactor), // Correction de la variable
      child: AvisClientsView(avis: []),
    );
  }
}
