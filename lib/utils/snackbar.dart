import 'package:flutter/material.dart';

//TEST: Used for testing only.
createSnackBar(context, input) {
  final snackBar = SnackBar(
    content: Text("$input"),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
