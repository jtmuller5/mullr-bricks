import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:{{#snakeCase}}{{name}}View{{/snakeCase}}/shared/observers/basic_navigator_observer.dart';
import 'package:stacked/stacked.dart';
import '../app/app_router.dart';
import '../app/get_it.dart';
import '../app/themes/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    MaterialApp(
      theme: lightTheme,
      home: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemStatusBarContrastEnforced: false),
      child: ViewModelBuilder<AppModel>.reactive(
        viewModelBuilder: () => AppModel(),
        onModelReady: (model) {
          // model.initialize();
        },
        builder: (context, model, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, nativeNavigator) {
              return GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Portal(
                    child: MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      themeMode: ThemeMode.system,
                      theme: lightTheme,
                      routerDelegate: appRouter.delegate(
                        navigatorObservers: () {
                          return [
                            if (kDebugMode) BasicNavigatorObserver(),
                          ];
                        },
                      ),
                      routeInformationParser: appRouter.defaultRouteParser(),
                    )),
              );
            },
          );
        },
      ),
    );
  }
}

class AppModel extends BaseViewModel {}
