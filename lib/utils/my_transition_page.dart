import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage transPage({
  LocalKey? key,
  required Widget child,
}) =>
    CustomTransitionPage(
      key: key,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return CupertinoPageTransition(
          primaryRouteAnimation: animation,
          secondaryRouteAnimation: Tween<double>(
            begin: 0,
            end: 0,
          ).animate(secondaryAnimation),
          linearTransition: false,
          child: child,
        );
      },
      child: child,
    );
