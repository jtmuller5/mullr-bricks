import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import '../shared/guards/check_connectivity_guard.dart';
import '../ui/dashboard/dashboard_view.dart';
import '../ui/feed/feed_view.dart';
import '../ui/home/home_view.dart';

import '../ui/shared/notConnected/not_connected_view.dart';
import 'app_router.gr.dart';

final appRouter = AppRouter(
  checkConnectivityGuard: CheckConnectivityGuard(),
);

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
