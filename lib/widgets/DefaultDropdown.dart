import 'package:flutter/material.dart';

class DefaultDropdown extends StatefulWidget {
  @override
  _DefaultDropdownState createState() => _DefaultDropdownState();
}

class _DefaultDropdownState extends State<DefaultDropdown> {
  var _listItems = ['A', 'B', 'C', 'D', 'E'];
  var _currentItemSelected = 'C';

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
            color: Colors.grey,
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
                    child: Text(value),
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
