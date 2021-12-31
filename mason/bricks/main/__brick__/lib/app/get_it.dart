import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mullr_components/services/color_service.dart';
import 'package:mullr_components/services/file_service.dart';
import 'package:mullr_components/services/string_service.dart';
import 'package:mullr_components/services/system_service.dart';
import 'package:mullr_components/services/time_service.dart';
import 'package:mullr_components/services/toast_service.dart';
import 'package:mullr_components/services/auth_service.dart';

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
  getIt.registerFactory<ColorService>(() => ColorService());
  getIt.registerFactory<FileService>(() => FileService());
  getIt.registerFactory<StringService>(() => StringService());
  getIt.registerFactory<TimeService>(() => TimeService());
  getIt.registerFactory<ToastService>(() => ToastService());
  getIt.registerFactory<SystemService>(() => SystemService());
  getIt.registerSingleton<AuthService>(AuthService());
}