import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class DefaultDropdown extends StatefulWidget {
  final List<String> listItems;
  final String currentItemSeleted;
  final bool haveSelectedItem;

  const DefaultDropdown(
      {Key key,
      this.listItems,
      this.currentItemSeleted,
      this.haveSelectedItem = false})
      : super(key: key);

  get currentItemSelected => this.currentItemSeleted;

  set currentItemSelected(String currentItemSelected) {
    currentItemSelected = this.currentItemSelected;
  }

  @override
  _DefaultDropdownState createState() => _DefaultDropdownState();
}

class _DefaultDropdownState extends State<DefaultDropdown> {
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
            color: widget.haveSelectedItem ? Colors.primary : Colors.grey,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              items: widget.listItems.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: widget.haveSelectedItem
                            ? Colors.primary
                            : Colors.grey,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  print("newValue: $newValue");
                  print("ItemUpdate: ${widget.currentItemSelected}");
                  widget.currentItemSelected = newValue;
                  print("ItemUpdate: ${widget.currentItemSelected}");
                });
              },
              value: widget.currentItemSelected,
            ),
          ),
        ),
      ),
    );
  }
}
