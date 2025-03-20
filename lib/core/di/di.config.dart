// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/repository/avis_clients_repository.dart' as _i990;
import '../../data/repository/avis_clients_repository_impl.dart' as _i552;
import '../../data/repository/users_repository.dart' as _i151;
import '../../data/repository/users_repository_impl.dart' as _i304;
import '../../domaine/usecases/fetch_avis_clients_data_usecase.dart' as _i122;
import '../../domaine/usecases/fetch_user_data_usecase.dart' as _i203;
import '../../ui/account/account_module.dart' as _i692;
import '../../ui/admin_page/admin_page_module.dart' as _i727;
import '../../ui/avis_clients/add_avis_clients_module.dart' as _i81;
import '../../ui/avis_clients/avis_clients_interactor.dart' as _i606;
import '../../ui/avis_clients/avis_clients_module.dart' as _i712;
import '../../ui/avis_clients_list/avis_clients_list_module.dart' as _i58;
import '../../ui/contact/contact_module.dart' as _i106;
import '../../ui/home_page/home_page_module.dart' as _i147;
import '../../ui/protfolio/portfolio_module.dart' as _i982;
import '../../ui/ui_module.dart' as _i573;
import '../../ui/users/add_user_module.dart' as _i753;
import '../../ui/users/login/login_module.dart' as _i863;
import '../api/auth_service.dart' as _i893;
import '../api/firestore_service.dart' as _i551;
import '../router/router_config.dart' as _i718;
import 'di_module.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final diModule = _$DiModule();
    gh.singleton<_i59.FirebaseAuth>(() => diModule.firebaseAuth);
    gh.singleton<_i974.FirebaseFirestore>(() => diModule.firebaseFireStore);
    gh.singleton<_i718.AppRouterConfig>(() => _i718.AppRouterConfig());
    gh.singleton<_i573.AppRouter>(() => _i573.AppRouter());
    gh.factory<_i203.FetchUserDataUseCase>(
      () => _i203.FetchUserDataUseCase(
        gh<String>(),
        gh<_i304.UsersRepositoryImpl>(),
      ),
    );
    gh.lazySingleton<_i893.AuthService>(
      () => _i893.AuthService(gh<_i59.FirebaseAuth>()),
    );
    gh.factory<_i551.FirestoreService>(
      () => _i551.FirestoreService(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i151.UsersRepository>(
      () => _i304.UsersRepositoryImpl(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i990.AvisClientsRepository>(
      () => _i552.AvisClientsRepositoryImpl(gh<_i551.FirestoreService>()),
    );
    gh.factory<_i122.FetchAvisClientDataUseCase>(
      () => _i122.FetchAvisClientDataUseCase(gh<_i990.AvisClientsRepository>()),
    );
    gh.singleton<_i81.AddAvisClientsModule>(
      () => _i81.AddAvisClientsModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i712.AvisClientsModule>(
      () => _i712.AvisClientsModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i58.AvisClientsListModule>(
      () => _i58.AvisClientsListModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i106.ContactModule>(
      () => _i106.ContactModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i147.HomePageModule>(
      () => _i147.HomePageModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i982.PortfolioModule>(
      () => _i982.PortfolioModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i692.AccountModule>(
      () => _i692.AccountModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i727.AdminPageModule>(
      () => _i727.AdminPageModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i753.AddUserModule>(
      () => _i753.AddUserModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i863.LoginModule>(
      () => _i863.LoginModule(gh<_i573.AppRouter>()),
    );
    gh.singleton<_i606.AvisClientsInteractor>(
      () => _i606.AvisClientsInteractor(
        gh<_i122.FetchAvisClientDataUseCase>(),
        gh<_i990.AvisClientsRepository>(),
      ),
    );
    return this;
  }
}

class _$DiModule extends _i211.DiModule {}
