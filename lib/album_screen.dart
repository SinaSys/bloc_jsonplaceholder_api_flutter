import 'package:bloc_jsonplaceholder_api/widget/error_txt.dart';
import 'package:bloc_jsonplaceholder_api/widget/list_row.dart';
import 'package:bloc_jsonplaceholder_api/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'album.dart';
import 'app_themes.dart';
import 'bloc/album_bloc.dart';
import 'bloc/events.dart';
import 'bloc/state.dart';
import 'bloc/theme/theme_bloc.dart';
import 'bloc/theme/theme_events.dart';

class AlbumsScreen extends StatefulWidget {
  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}
class _AlbumsScreenState extends State<AlbumsScreen> {

  AppTheme _selectedTheme;
  //
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }
  _loadAlbums() async {
    context.bloc<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  }

  _setTheme(bool darkTheme) async {
    _selectedTheme =
    darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
    context.bloc<ThemeBloc>().add(ThemeEvent(appTheme: _selectedTheme));
    //  Preferences.saveTheme(selectedTheme);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: _selectedTheme==AppTheme.lightTheme,
            onChanged: (value){
              _setTheme(value);
            },
          )
        ],
        title: Text('Albums'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }
  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumsState>(
            builder: (BuildContext context, AlbumsState state) {
              if (state is AlbumsListError) {
                final error = state.error;
                String message = '${error.message}\nTap to Retry.';
                return ErrorTxt(
                  msg:message,
                  onTap: _loadAlbums,
                );
              }
              if (state is AlbumsLoaded) {
                List<Album> albums = state.albums;
                return _list(albums);
              }
              return Loading();
            }),
      ],
    );
  }
  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          Album album = albums[index];
          return ListRow(album: album);
        },
      ),
    );
  }
}

