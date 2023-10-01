import 'package:flutter/material.dart';
import 'package:news_app_bloc/app/views/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'route_name.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings? route) {
    switch (route!.name) {
      case RouteName.root:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.fade,
        );
      default:
        return _errorRoute();
    }
  }

  // AppRouter._(); CheckOutScreen
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      ),
    );
  }
}
