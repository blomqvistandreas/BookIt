import 'package:flutter/material.dart' hide Colors;
import 'package:bookit_app/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double height, horizontalPadding;

  const DefaultButton(
      {Key key,
      @required this.title,
      @required this.onPressed,
      this.height,
      this.horizontalPadding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.primary, Colors.secondary],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: FlatButton(
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          onPressed: () {
            onPressed();
          },
        ),
      ),
    );
  }
}
