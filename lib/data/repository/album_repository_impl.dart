import 'package:dio/dio.dart';
import 'package:flutter_localization/data/repository/album_repository.dart';
import '../model/album.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  final Dio _dioClient = Dio(
    BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 30000,
    ),
  );

  @override
  Future<List<Album>?> getHttp() async {
    try {
      Response response =
          await _dioClient.get('https://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        var albumData = response.data as List;
        var listAlbums =
            albumData.map((element) => Album.fromJson(element)).toList();
        return listAlbums;
      }
    } catch (error) {
      return Future.error("$error");
    }
    return null;
  }
}
