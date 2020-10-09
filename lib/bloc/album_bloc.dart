import 'dart:io';

import 'package:bloc_jsonplaceholder_api/bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../album.dart';
import '../album_repo.dart';
import '../exceptions.dart';
import 'events.dart';

class AlbumsBloc extends Bloc<AlbumEvents, AlbumsState> {

  final AlbumsRepo albumsRepo;
  List<Album> albums;
  AlbumsBloc({this.albumsRepo}) : super(AlbumsInitState());
  @override
  Stream<AlbumsState> mapEventToState(AlbumEvents event) async* {
    switch (event) {
      case AlbumEvents.fetchAlbums:
        yield AlbumsLoading();
        try {
          albums = await albumsRepo.getAlbumList();
          yield AlbumsLoaded(albums: albums);
        } on SocketException {
          yield AlbumsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield AlbumsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield AlbumsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield AlbumsListError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}