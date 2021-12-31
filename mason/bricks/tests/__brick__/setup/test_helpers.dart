import '../../services/string_service.dart';
import '../../app/app_router.gr.dart';
import '../../services/app/user_service.dart';
import '../../services/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_helpers.mocks.dart';

/// All functions in Mocks must be mocked if they are called in tests
/// 1 - Add services to customMocks list
/// 2 - Create helper function to register and mock each service

@GenerateMocks(
  [],
  customMocks: [
    // If we don't supply returnNullOnMissingStub then we'll get an exception when
    // a non-stubbed method is called.
    MockSpec<UserService>(returnNullOnMissingStub: true),
    MockSpec<AppRouter>(returnNullOnMissingStub: true),
    //MockSpec<StringService>(returnNullOnMissingStub: true),
  ],
)
void registerServices() {
  getAndRegisterUserService();
 // getAndRegisterStringService();
}

void unregisterService() {
  getIt.unregister<UserService>();
  //getIt.unregister<StringService>();
}

/// Individual Services and Utility Classes

AppRouter getAppRouter() {
  final appRouter = MockAppRouter();
  return appRouter;
}

UserService getAndRegisterUserService() {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();

  /// Mock functions...

  getIt.registerSingleton<UserService>(service);
  return service;
}

void _removeRegistrationIfExists<T extends Object>() {
  if (getIt.isRegistered<T>()) {
    getIt.unregister<T>();
  }
}
