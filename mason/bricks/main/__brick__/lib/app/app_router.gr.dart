// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:{{name.snakeCase()}}_view/snakeCase}}/ui/dashboard/dashboard_view.dart' as _i3;
import 'package:{{name.snakeCase()}}_view/snakeCase}}/ui/feed/feed_view.dart' as _i4;
import 'package:{{name.snakeCase()}}_view/snakeCase}}/ui/home/home_view.dart' as _i1;
import 'package:{{name.snakeCase()}}_view/snakeCase}}/ui/shared/notConnected/not_connected_view.dart'
    as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomeView());
    },
    NotConnectedViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.NotConnectedView());
    },
    DashboardViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.DashboardView());
    },
    FeedViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.FeedView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(HomeViewRoute.name, path: '/', children: [
          _i5.RouteConfig(DashboardViewRoute.name,
              path: 'dashboard-view', parent: HomeViewRoute.name),
          _i5.RouteConfig(FeedViewRoute.name,
              path: 'feed-view', parent: HomeViewRoute.name)
        ]),
        _i5.RouteConfig(NotConnectedViewRoute.name, path: '/not-connected-view')
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i5.PageRouteInfo<void> {
  const HomeViewRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeViewRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [_i2.NotConnectedView]
class NotConnectedViewRoute extends _i5.PageRouteInfo<void> {
  const NotConnectedViewRoute()
      : super(NotConnectedViewRoute.name, path: '/not-connected-view');

  static const String name = 'NotConnectedViewRoute';
}

/// generated route for
/// [_i3.DashboardView]
class DashboardViewRoute extends _i5.PageRouteInfo<void> {
  const DashboardViewRoute()
      : super(DashboardViewRoute.name, path: 'dashboard-view');

  static const String name = 'DashboardViewRoute';
}

/// generated route for
/// [_i4.FeedView]
class FeedViewRoute extends _i5.PageRouteInfo<void> {
  const FeedViewRoute() : super(FeedViewRoute.name, path: 'feed-view');

  static const String name = 'FeedViewRoute';
}
