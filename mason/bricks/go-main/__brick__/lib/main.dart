import 'package:{{name.snakeCase()}}/app/router.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:stacked/stacked.dart';
import '../app/get_it.dart';
import '../app/themes/light_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  {{#firebase}}
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders(
      [EmailAuthProvider()]
  );

  FirebaseAnalytics.instance.logAppOpen();
  {{\firebase}}

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
      child: Portal(
        child: MaterialApp.router(
          theme: lightTheme,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          title: 'My App',
        ),
      ),
    );
  }
}