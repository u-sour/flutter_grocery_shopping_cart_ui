import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../screens/cart_screen.dart';
import '../screens/home_screen.dart';
import '../screens/intro_screen.dart';
import 'router_utils.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: SCREENS.intro.path,
  routes: <RouteBase>[
    GoRoute(
      path: SCREENS.cart.path,
      name: SCREENS.cart.name,
      builder: (BuildContext context, GoRouterState state) {
        return const CartScreen();
      },
    ),
    GoRoute(
      path: SCREENS.home.path,
      name: SCREENS.home.name,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: SCREENS.intro.path,
      name: SCREENS.intro.name,
      builder: (BuildContext context, GoRouterState state) {
        return const IntroScreen();
      },
    ),
  ],
);
