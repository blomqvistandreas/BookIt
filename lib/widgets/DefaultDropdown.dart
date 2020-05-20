import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class DefaultDropdown extends StatefulWidget {
  @override
  _DefaultDropdownState createState() => _DefaultDropdownState();
}

class _DefaultDropdownState extends State<DefaultDropdown> {
  var _listItems = ['A', 'B'];
  var _currentItemSelected = 'A';
  var _haveSelectedItem = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _haveSelectedItem ? Colors.primary : Colors.grey,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              items: _listItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: _haveSelectedItem ? Colors.primary : Colors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  _currentItemSelected = newValue;
                });
              },
              value: _currentItemSelected,
            ),
          ),
        ),
      ),
    );
  }
}
