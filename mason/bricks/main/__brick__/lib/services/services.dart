import 'package:get_it/get_it.dart';

import 'package:mullr_components/services/auth_service.dart';
import 'package:mullr_components/services/color_service.dart';
import 'package:mullr_components/services/string_service.dart';
import 'package:mullr_components/services/system_service.dart';
import 'package:mullr_components/services/time_service.dart';
import 'package:mullr_components/services/toast_service.dart';
import 'firebase/firebase_service.dart';
import 'utilities/app_service.dart';
import 'cloud_storage_service.dart';
import 'user_service.dart';
import 'utilities/hive_service.dart';


AppService get appService {
  return GetIt.instance.get<AppService>();
}

AuthService get authService {
  return GetIt.instance.get<AuthService>();
}

CloudStorageService get cloudStorageService {
  return GetIt.instance.get<CloudStorageService>();
}

ColorService get colorService {
  return GetIt.instance.get<ColorService>();
}

FirebaseService get firebaseService {
  return GetIt.instance.get<FirebaseService>();
}

HiveService get hiveService {
  return GetIt.instance.get<HiveService>();
}

StringService get stringService {
  return GetIt.instance.get<StringService>();
}

SystemService get systemService {
  return GetIt.instance.get<SystemService>();
}

TimeService get timeService {
  return GetIt.instance.get<TimeService>();
}

ToastService get toastService {
  return GetIt.instance.get<ToastService>();
}

UserService get userService {
  return GetIt.instance.get<UserService>();
}