import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class DefaultSubHeader extends StatelessWidget {
  final String title;
  final double fontSize;

  const DefaultSubHeader({Key key, this.title, this.fontSize = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(22, 0, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: fontSize, color: Colors.grey),
        ),
      ),
    );
  }
}
