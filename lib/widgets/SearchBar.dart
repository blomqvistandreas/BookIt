import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _didEnterText = false;
  String _enteredText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.primary, Colors.secondary]),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                onChanged: (text) {
                  if (text == "") {
                    setState(() {
                      _didEnterText = false;
                    });
                  } else {
                    setState(() {
                      _didEnterText = true;
                      _enteredText = text;
                    });
                  }
                  //TODO: SearchBar functionallity
                  //widget.textInput(text);
                  print("$text");
                },
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            _didEnterText
                ? IconButton(
                    onPressed: () {
                      print(_enteredText);
                      setState(() {
                        _enteredText = "";
                      });
                    },
                    icon: Icon(Icons.cancel),
                  )
                : Container(),
            Icon(Icons.search),
          ],
        ),
      ),
    );
  }
}
