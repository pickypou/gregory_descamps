import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gregory_descamps/ui/avis_clients_list/view/avis_clients_list_view.dart';
import 'package:injectable/injectable.dart';

import '../ui_module.dart';
import 'avis_clients_list_bloc.dart';
import 'avis_clients_list_interactor.dart';

@singleton
class AvisClientsListModule implements UIModule {
  final AppRouter _appRouter;

  AvisClientsListModule(this._appRouter);

  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }

  @override
  List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: '/avisClients',
        pageBuilder: (context, state) {
          return MaterialPage(child: _buildAvisClientsList());
        },
      ),
    ];
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    return {};
  }

  Widget _buildAvisClientsList() {
    return BlocProvider<AvisClientsListBloc>(
      create: (context) {
        final String avisClientsId = '';
        var avisClientListInteractor = AvisClientsListInteractor();

        return AvisClientsListBloc(
          avisClientListInteractor,
          avisClientsId: avisClientsId,
        );
      },
      child: AvisClientsListView(),
    );
  }
}
