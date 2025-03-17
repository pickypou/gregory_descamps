
import 'package:get_it/get_it.dart';

import '../../data/repository/avis_clients_repository_impl.dart';
import 'fetch_avis_clients_data_usecase.dart';

final GetIt getIt = GetIt.instance;

void setupUseCaseModule() {
  // Enregistrement du cas d'utilisation FetchAvisClientsDataUseCase
  getIt.registerLazySingleton<FetchAvisClientDataUseCase>(
          () => FetchAvisClientDataUseCase(getIt<AvisClientsRepositoryImpl>())
  );

}