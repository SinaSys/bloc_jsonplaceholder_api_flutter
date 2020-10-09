import 'package:flutter/material.dart';

class ErrorTxt extends StatelessWidget {
  //
  final String msg;
  final Function onTap;


  ErrorTxt({this.msg, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          msg,
          style: TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}