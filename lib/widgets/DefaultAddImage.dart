import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class DefaultAddImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          width: 2.0,
          color: Colors.grey,
        ),
        color: Colors.transparent,
      ),
      child: IconButton(
        onPressed: () {
          print("HI HELLO I PRESSED BUTTON");
        },
        icon: Icon(
          Icons.add,
          color: Colors.grey,
        ),
        iconSize: 50,
      ),
    );
  }
}
