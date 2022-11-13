import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:{{name.snakeCase()}}_view/snakeCase}}/services/utilities/file_service.dart';
import 'package:{{name.snakeCase()}}_view/snakeCase}}/services/utilities/string_service.dart';
import 'package:{{name.snakeCase()}}_view/snakeCase}}/services/utilities/system_service.dart';
import 'package:{{name.snakeCase()}}_view/snakeCase}}/services/utilities/time_service.dart';
import 'package:{{name.snakeCase()}}_view/snakeCase}}/services/utilities/toast_service.dart';

import 'get_it.config.dart';

final getIt = GetIt.instance;

// flutter packages pub run build_runner watch
// flutter packages pub run build_runner build --delete-conflicting-outputs

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default

)

void configureDependencies({String? env}) {
  // Configure app-specific dependencies
  $initGetIt(getIt, environment: env);

  // Register shared services
  getIt.registerFactory<FileService>(() => FileService());
  getIt.registerFactory<StringService>(() => StringService());
  getIt.registerFactory<TimeService>(() => TimeService());
  getIt.registerFactory<ToastService>(() => ToastService());
  getIt.registerFactory<SystemService>(() => SystemService());
}