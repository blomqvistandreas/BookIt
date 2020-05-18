import 'package:flutter/material.dart';

Container defaultHeader(String title) {
  return Container(
    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
    height: 100,
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
    ),
  );
}
