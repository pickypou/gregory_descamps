

import 'package:get_it/get_it.dart';
import 'package:gregory_descamps/core/di/di.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.init(); // Initialisation générée par Injectable
}