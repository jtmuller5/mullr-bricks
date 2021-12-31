import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../app/app_router.dart';
import '../../app/app_router.gr.dart';

/// Push user to DecisionView if logged out
/// Otherwise push to HomeView
class CheckAuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final loggedIn = FirebaseAuth.instance.currentUser != null;
    if (loggedIn) {
      resolver.next(true);
    } else {
      appRouter.push(const DecisionViewRoute());
    }
  }
}