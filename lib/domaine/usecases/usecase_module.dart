import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:gregory_descamps/data/repository/users_repository_impl.dart';

import '../../data/repository/avis_clients_repository_impl.dart';
import '../../data/repository/users_repository.dart';
import 'fetch_avis_clients_data_usecase.dart';

final GetIt getIt = GetIt.instance;

void setupUseCaseModule() {
  // Enregistrement du cas d'utilisation FetchAvisClientsDataUseCase
  getIt.registerLazySingleton<FetchAvisClientDataUseCase>(
    () => FetchAvisClientDataUseCase(getIt<AvisClientsRepositoryImpl>()),
  );

  getIt.registerLazySingleton<UsersRepository>(
    () =>
        UsersRepositoryImpl(getIt<FirebaseFirestore>(), getIt<FirebaseAuth>()),
  );
}
