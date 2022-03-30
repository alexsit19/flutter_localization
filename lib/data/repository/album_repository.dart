import 'package:flutter_localization/data/model/album.dart';

abstract class AlbumRepository {
  Future<List<Album>?> getHttp();
}
