import 'package:flutter/material.dart';
import 'package:flutter_localization/navigation/app_routes.dart';
import 'package:flutter_localization/screens/first_screen.dart';
import 'package:flutter_localization/screens/second_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const FirstScreen());
      case AppRoutes.secondScreen:
        return MaterialPageRoute(builder: (context) => SecondScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
          centerTitle: true,
        ),
        body: const Center(child: Text('Page not found.')),
      );
    });
  }
}
