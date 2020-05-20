import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class DefaultTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;

  const DefaultTextField({Key key, this.label, this.controller})
      : super(key: key);

  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        controller: widget.controller,
        cursorColor: Colors.primary,
        cursorRadius: Radius.circular(10.0),
        cursorWidth: 16.0,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: widget.label,
        ),
      ),
    );
  }
}
