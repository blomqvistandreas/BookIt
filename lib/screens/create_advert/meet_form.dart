import 'package:bookit_app/styles/colors.dart';
import 'package:bookit_app/widgets/defaults/default_textfield.dart';
import 'package:flutter/material.dart' hide Colors;

class MeetForm extends StatefulWidget {
  final Function(String) textInput;
  final Function(bool) meetUpAgreement;
  const MeetForm({Key key, this.textInput, this.meetUpAgreement})
      : super(key: key);

  @override
  _MeetFormState createState() => _MeetFormState();
}

class _MeetFormState extends State<MeetForm> {
  bool _meetUpAgreement = false;
  String _didInputText;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            width: 2.0,
            color: formComplete() ? Colors.primary : Colors.grey,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                  "Du har valt att mötas upp för att byta din bok, vi rekommenderar att ALLTID träffas på offentlig plats."),
              SizedBox(height: 10),
              Text("Här skriver du i vilken stad träffen skall äga rum."),
              SizedBox(height: 10),
              DefaultTextField(
                label: "Stad",
                textInput: (text) {
                  setState(() {
                    _didInputText = text;
                    print("Text: $_didInputText");
                  });
                  widget.textInput(text);
                },
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Text(
                  "Din säkerhet är viktig! Läs igenom vårat Meet Up Agreement."),
              SizedBox(height: 10),
              buildAgreementCheckbox(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildAgreementCheckbox() {
    return Row(
      children: [
        Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          checkColor: Colors.primary,
          activeColor: Colors.transparent,
          value: _meetUpAgreement,
          onChanged: (bool value) {
            setState(() {
              widget.meetUpAgreement(value);
              _meetUpAgreement = value;
            });
          },
        ),
        Expanded(
          child: Text(
              "Jag har nogrannt läst igenom och samtycker till Meet Up Agreement.",
              style: TextStyle(fontSize: 12)),
        ),
      ],
    );
  }

  bool formComplete() {
    if (_didInputText != null && _meetUpAgreement) {
      return true;
    }
    return false;
  }
}
