import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class DefaultTextField extends StatefulWidget {
  final String label;
  final Function(String) textInput;

  const DefaultTextField({Key key, this.label, this.textInput})
      : super(key: key);

  @override
  _DefaultTextFieldState createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  var _didInputText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        onSubmitted: (text) {
          setState(() {
            if (text != null && text != "") {
              _didInputText = true;
              widget.textInput(text);
            } else {
              _didInputText = false;
              //Alert and shake
            }
          });
        },
        textCapitalization: TextCapitalization.sentences,
        cursorColor: Colors.primary,
        cursorRadius: Radius.circular(20),
        cursorWidth: 17.0,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: _didInputText ? Colors.primary : Colors.grey,
                width: 2.0),
            borderRadius: BorderRadius.circular(20),
          ),
          labelText: widget.label,
          labelStyle: TextStyle(
            color: _didInputText ? Colors.primary : Colors.grey,
          ),
        ),
      ),
    );
  }
}
