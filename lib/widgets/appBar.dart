import 'package:flutter/material.dart';

Widget appBar(String title) {
  return AppBar(
      elevation: 0.0,
      // leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){},),
      title: Text(title, style: TextStyle(color: Colors.white)),
      actions: <Widget>[
        Container(
          width: 45.0,
          child: Center(
            child: GestureDetector(
              child: Text("KI"),
            ),
          ),
        ),
        Container(
          width: 45.0,
          child: Center(
            child: GestureDetector(child: Text("FR")),
          ),
        ),
        Container(
          width: 45.0,
          child: Center(
            child: GestureDetector(child: Text("EN")),
          ),
        ),
      ]);
}
