import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gregory_descamps/ui/users/login/user_login_bloc.dart';
import 'package:gregory_descamps/ui/users/login/view/login_view.dart';
import 'package:injectable/injectable.dart';

import '../../../core/di/di.dart';
import '../../../data/repository/users_repository.dart';
import '../../ui_module.dart';
import 'login_interactor.dart';

@singleton
class LoginModule implements UIModule {
  final AppRouter _appRouter;

  LoginModule(this._appRouter);
  @override
  void configure() {
    _appRouter.addRoutes(getRoutes());
  }

  @override
  List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) {
          return MaterialPage(child: _buildLoginPage());
        },
      ),
    ];
  }

  Widget _buildLoginPage() {
    return BlocProvider<UserLoginBloc>(
      create: (context) {
        UsersRepository usersRepository = getIt<UsersRepository>();

        var interactor = LoginInteractor(usersRepository: usersRepository);
        return UserLoginBloc(interactor, userId: '');
      },
      child: LoginView(),
    );
  }

  @override
  Map<String, WidgetBuilder> getSharedWidgets() {
    return {};
  }
}
