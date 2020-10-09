import 'package:flutter/material.dart';

import '../album.dart';

class ListRow extends StatelessWidget {
  //
  final Album album;
  ListRow({this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${album.userId}'),
          SizedBox(height: 10),
          Text(album.title),
        ],
      ),
    );
  }
}
