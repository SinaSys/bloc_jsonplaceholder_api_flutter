import 'album.dart';

abstract class AlbumsRepo {
  Future<List<Album>> getAlbumList();
}