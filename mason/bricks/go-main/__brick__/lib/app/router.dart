import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/features/home/ui/home/home_view.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    // MARK: Root
    MaterialRoute(
        page: HomeView,
        path: '/',
        initial: true,
        guards: [AuthGuard]
    ),
    MaterialRoute(
      page: NewPostView,
      path: '/new-post',
    ),
    {{#firebase}}
    MaterialRoute(page: RegisterScreen, path: '/register'),
    CustomRoute(
      path: '/sign-in',
      page: SignInScreen,
      customRouteBuilder: signInRouteBuilder,
    ),
    CustomRoute(
      path: '/profile',
      page: ProfileScreen,
      customRouteBuilder: profileRouteBuilder,
    ),
    {{/firebase}}
  ],
)
class $Router {}
