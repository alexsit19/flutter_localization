import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/data/repository/album_repository_impl.dart';
import 'package:flutter_localization/widgets/error_widget.dart';
import 'package:flutter_localization/widgets/list_albums.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);
  final albumRepository = AlbumRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.secondScreen),
      ),
      body: FutureBuilder<List<dynamic>?>(
          future: albumRepository.getHttp(),
          builder: (context, snapshot) {
            Widget child = const Center(
              child: CircularProgressIndicator(),
            );
            if (snapshot.hasData) {
              child = ListAlbums(list: snapshot);
            } else if (snapshot.hasError) {
              child = const CustomErrorWidget();
            }
            return child;
          }),
    );
  }
}
