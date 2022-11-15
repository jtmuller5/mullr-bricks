import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name.snakeCase()}}/features/home/ui/home/home_view.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    {{#firebase}}
     GoRoute(
      path: '/sign-in',
      builder: (context, state) {
        return SignInScreen(

          headerBuilder: (context, constraints, shrinkOffset) {
            return Image.asset('assets/images/{{name.snakeCase()}}_logo.png');
          },
          actions: [
            AuthStateChangeAction<SignedIn>((context, state) {
              FirebaseAnalytics.instance.logLogin(loginMethod: 'app');
              router.replace('/');
            }),
            AuthStateChangeAction<UserCreated>((context, state) {
              FirebaseAnalytics.instance.logSignUp(signUpMethod: 'app');
              router.replace('/');
            })
          ],
        );
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return RegisterScreen();
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) {
        return ProfileScreen(
          appBar: AppBar(
            title: Text('Profile'),
          ),
          actions: [
            SignedOutAction((context) {
              router.pop();
              router.replace('/');
            }),
          ],
        );
      },
    ),
    {{/firebase}}

  ],
);