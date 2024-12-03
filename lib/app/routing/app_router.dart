import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';
import '../app.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRoutes = GoRouter(
  initialLocation: Routes.orders.withSlash,
  navigatorKey: navigatorKey,
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: Routes.orders.withSlash,
          name: Routes.orders,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const MetricScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Slide from left to right for the Metric screen
                const begin = Offset(-1.0, 0.0); // Slide from left to right
                const end = Offset.zero;
                const curve = Curves.easeInOut;
                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(position: offsetAnimation, child: child);
              },
            );
          },
        ),
        GoRoute(
            path: Routes.graph.withSlash,
            name: Routes.graph,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const GraphScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0); // Slide from right to left
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              );
            }),
      ],
      builder: (_, __, child) => LayoutScreen(child: child),
    ),
  ],
);

final GoRouter webRoutes = GoRouter(
  initialLocation: Routes.layout.withSlash,
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: Routes.layout.withSlash,
      name: Routes.layout,
      builder: (context, state) => const WebLayoutScreen(),
    ),
  ],
);
