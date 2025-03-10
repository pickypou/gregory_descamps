import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gregory_descamps/ui/protfolio/portfolio.dart';
import 'package:injectable/injectable.dart';

import '../ui_module.dart';

@singleton
class PortfolioModule implements UIModule {
  final AppRouter _appRouter;

  const PortfolioModule(this._appRouter);

  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }
  @override
  List<RouteBase> getRoutes()  {
    return [
      GoRoute(
        path: '/portfolio',
        builder: (context, state) =>  Portfolio(),
      )
    ];
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    // Implémentation de la méthode manquante
    return {};
  }
}