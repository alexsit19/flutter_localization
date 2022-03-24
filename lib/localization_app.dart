import 'package:flutter/material.dart';
import 'package:flutter_localization/navigation/routes_generator.dart';

class LocalizationApp extends StatelessWidget {
  const LocalizationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}