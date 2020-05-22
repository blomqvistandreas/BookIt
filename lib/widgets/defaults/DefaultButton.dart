import 'package:flutter/material.dart' hide Colors;
import 'package:bookit_app/styles/colors.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final double width;
  final Function onPressed;

  const DefaultButton(
      {Key key, this.title = "Continue", this.width = 120.0, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.secondary, Colors.primary],
        ),
        color: Colors.primary,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 2,
          color: Colors.secondary,
        ),
      ),
      child: FlatButton(
        child: Center(
          child: Text(title),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
