import 'package:gregory_descamps/domaine/usecases/usecase_module.dart';

import 'entity/entity_module.dart';

void setupDomainModule() {
  // Setup des entités
  setupEntityModule();

  //Setupt des Use Case
  setupUseCaseModule();
}