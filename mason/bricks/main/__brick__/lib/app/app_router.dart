import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/ui/dashboard/dashboard_view.dart';
import 'package:{{#snakeCase}}{{name}}{{/snakeCase}}/ui/feed/feed_view.dart';
import '../ui/home/home_view.dart';

import '../ui/shared/notConnected/not_connected_view.dart';
import 'app_router.gr.dart';

final appRouter = AppRouter();

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(
    page: HomeView,
    initial: true,
      children: [
        AutoRoute(page: DashboardView),
        AutoRoute(page: FeedView),
      ]
  ),
  AutoRoute(page: NotConnectedView),
])
class $AppRouter {}
