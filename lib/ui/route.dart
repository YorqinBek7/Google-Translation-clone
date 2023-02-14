import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gtranslation_clone/ui/splash_screen/on_boarding_1.dart';
import 'package:gtranslation_clone/ui/splash_screen/on_boarding_2.dart';
import 'package:gtranslation_clone/ui/splash_screen/splash_screen.dart';

class OnGenareteRoute {
  static final OnGenareteRoute INSTANCE = OnGenareteRoute._();
  factory OnGenareteRoute() => INSTANCE;
  OnGenareteRoute._();

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return navigatePage(const SplashScreen(), settings);
      case '/on_boarding_first':
        return navigatePage(const OnBoardingFirst(), settings);
      case '/on_boarding_second':
        return navigatePage(const OnBoardingSecond(), settings);
    }
  }

  Route navigatePage(Widget screen, RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionDuration: const Duration(milliseconds: 800),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
