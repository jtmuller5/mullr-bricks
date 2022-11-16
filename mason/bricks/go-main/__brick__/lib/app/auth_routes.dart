import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/app/router.gr.dart' hide SignInScreen, ProfileScreen;
import 'package:{{name.snakeCase()}}/app/services.dart';

import '../features/feed/ui/feed_view.dart';

Route<T> signInRouteBuilder<T>(BuildContext context, Widget child, CustomPage<T> page) {
  return PageRouteBuilder(
      settings: page,
      pageBuilder: (context, __, ___) => SignInScreen(
        headerBuilder: (context, constraints, shrinkOffset) {
          return Image.asset('assets/images/{{name.snakeCase()}}_logo.png');
        },
        sideBuilder: (context, constraints) {
          return Image.asset('assets/images/{{name.snakeCase()}}_logo.png');
        },
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            FirebaseAnalytics.instance.logLogin(loginMethod: 'app');
            router.replace(const FeedRoute());
          }),
          AuthStateChangeAction<UserCreated>((context, state) {
            FirebaseAnalytics.instance.logSignUp(signUpMethod: 'app');
            router.replace(const FeedRoute());
          })
        ],
      ));
}

Route<T> profileRouteBuilder<T>(BuildContext context, Widget child, CustomPage<T> page) {
  return PageRouteBuilder(
      settings: page,
      pageBuilder: (context, __, ___) => ProfileScreen(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        actions: [
          SignedOutAction((context) {
            router.pop();
            router.replace(const FeedRoute());
          }),
        ],
        children: [],
      ));
}