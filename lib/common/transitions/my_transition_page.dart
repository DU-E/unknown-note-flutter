import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage transPage({
  LocalKey? key,
  required Widget child,
}) =>
    CustomTransitionPage(
      key: key,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          CupertinoPageTransition(
        primaryRouteAnimation: animation,
        secondaryRouteAnimation: secondaryAnimation,
        linearTransition: false,
        child: child,
      ),
      child: child,
    );
