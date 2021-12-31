import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../app/app_router.dart';
import '../../app/app_router.gr.dart';

/// Push user to DecisionView if logged out
/// Otherwise push to HomeView
class CheckConnectivityGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    final bool connected = connectivityResult != ConnectivityResult.none;

    if (connected) {
      resolver.next(true);
    } else {
      appRouter.push(const NotConnectedViewRoute());
    }
  }
}
