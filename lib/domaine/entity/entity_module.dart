import 'package:get_it/get_it.dart';
import 'package:gregory_descamps/domaine/entity/users.dart';

import 'avis_clients.dart';

final GetIt getIt = GetIt.instance;

void setupEntityModule() {
  getIt.registerFactory<AvisClients>(() =>
      AvisClients(
        id: '', // Provide a default or generate a unique ID
        text: '', // Provide a default text
        publishDate: DateTime.now(),
        firstname: '', // Use current date as default
      ));

  //Register Users
  getIt.registerFactory<Users>(
          () => Users(id: '', userName: '', email: '', password: ''));
}
