import 'package:bloc_jsonplaceholder_api/album_repo.dart';
import 'package:bloc_jsonplaceholder_api/album_service.dart';
import 'package:bloc_jsonplaceholder_api/bloc/album_bloc.dart';
import 'package:bloc_jsonplaceholder_api/bloc/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'album_screen.dart';
import 'bloc/theme/theme_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState themeState) {
          return MaterialApp(
            theme:themeState.themeData ,
            debugShowCheckedModeBanner: false,
            home: BlocProvider(
                create: (BuildContext context) {
                  return AlbumsBloc(albumsRepo: AlbumServices());
                },
                child: AlbumsScreen()),
          );},),);}
}
