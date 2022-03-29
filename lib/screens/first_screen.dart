import 'package:flutter/material.dart';
import 'package:flutter_localization/navigation/app_routes.dart';
import '../data/album.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Album? albumItem;
  String titleText = "";
  String bodyText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.firstScreen),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _navigateAndGetData(context);
              },
              child: Text(AppLocalizations.of(context)!.goToSecondScreen),
            ),
            Card(
              child: ListTile(
                title: Text(titleText),
                subtitle: Text(bodyText),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _navigateAndGetData(BuildContext context) async {
    final result =
        await Navigator.of(context).pushNamed(AppRoutes.secondScreen);
    albumItem = result as Album;
    updateTextData(albumItem);
  }

  void updateTextData(Album? albumItem) {
    setState(() {
      titleText = albumItem?.title ?? titleText;
      bodyText = albumItem?.body ?? bodyText;
    });
  }
}
