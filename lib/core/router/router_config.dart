import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gregory_descamps/core/di/di.dart';
import 'package:gregory_descamps/ui/avis_clients_list/avis_clients_list_module.dart';
import 'package:gregory_descamps/ui/contact/contact_module.dart';
import 'package:gregory_descamps/ui/home_page/home_page_module.dart';
import 'package:gregory_descamps/ui/protfolio/portfolio_module.dart';
import 'package:injectable/injectable.dart';

import '../../ui/avis_clients/avis_clients_module.dart';

@singleton
class AppRouterConfig {
  GoRouter get router => GoRouter(
    routes: [
      ...getIt<HomePageModule>().getRoutes(),
      ...getIt<ContactModule>().getRoutes(),
      ...getIt<PortfolioModule>().getRoutes(),
      ...getIt<AvisClientsModule>().getRoutes(),
      ...getIt<AvisClientsListModule>().getRoutes(),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Page not found')));
  }
}
