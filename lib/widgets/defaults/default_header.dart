import 'package:flutter/material.dart';

class DefaultHeader extends StatelessWidget {
  final String title;
  final double fontSize;

  const DefaultHeader({Key key, this.title, this.fontSize = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 40, 15, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
