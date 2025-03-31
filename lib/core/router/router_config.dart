import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gregory_descamps/core/di/di.dart';
import 'package:gregory_descamps/ui/account/account_module.dart';
import 'package:gregory_descamps/ui/admin_page/admin_page_module.dart';
import 'package:gregory_descamps/ui/avis_clients/add_avis_clients_module.dart';

import 'package:gregory_descamps/ui/users/add_user_module.dart';
import 'package:gregory_descamps/ui/users/login/login_module.dart';
import 'package:gregory_descamps/ui/view_all/view_all_module.dart';
import 'package:injectable/injectable.dart';


@singleton
class AppRouterConfig {
  GoRouter get router => GoRouter(
    routes: [
      ...getIt<ViewAllModule>().getRoutes(),
      ...getIt<AddAvisClientsModule>().getRoutes(),
      ...getIt<AdminPageModule>().getRoutes(),
      ...getIt<AddUserModule>().getRoutes(),
      ...getIt<LoginModule>().getRoutes(),
      ...getIt<AccountModule>().getRoutes(),
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
