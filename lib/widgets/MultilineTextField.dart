import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class MultilineTextField extends StatefulWidget {
  final String label;
  final Function(String) textInput;

  const MultilineTextField({Key key, this.label, this.textInput})
      : super(key: key);

  @override
  _MultilineTextFieldState createState() => _MultilineTextFieldState();
}

class _MultilineTextFieldState extends State<MultilineTextField> {
  var _didInputText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        onChanged: (text) {
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
        maxLength: 150,
        maxLengthEnforced: true,
        maxLines: 30,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        cursorColor: Colors.primary,
        cursorRadius: Radius.circular(20),
        cursorWidth: 17.0,
        decoration: InputDecoration(
          alignLabelWithHint: true,
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
