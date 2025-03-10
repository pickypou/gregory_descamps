import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gregory_descamps/core/di/di.dart';
import 'package:gregory_descamps/ui/home_page/home_page_module.dart';
import 'package:injectable/injectable.dart';



@singleton
class AppRouterConfig {
  GoRouter get router => GoRouter(
    routes: [
    ...getIt<HomePageModule>().getRoutes()
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}


class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    );
  }
}