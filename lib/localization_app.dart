import 'package:flutter/material.dart';
import 'package:flutter_localization/navigation/routes_generator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationApp extends StatelessWidget {
  const LocalizationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}