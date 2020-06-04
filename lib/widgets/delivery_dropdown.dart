import 'package:flutter/material.dart' hide Colors;
import 'package:bookit_app/styles/colors.dart';

class DeliveryDropdown extends StatefulWidget {
  final Function(String) deliveryPicked;

  const DeliveryDropdown({Key key, this.deliveryPicked}) : super(key: key);

  @override
  _DeliveryDropdownState createState() => _DeliveryDropdownState();
}

class _DeliveryDropdownState extends State<DeliveryDropdown> {
  var _listItems = [
    "Välj leverans alternativ...",
    "Jag föredrar att posta boken",
    "Jag vill träffas för att byta boken"
  ];
  var _currentItemSelected = "Välj leverans alternativ...";
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
            width: 2.0,
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
                        color: _haveSelectedItem ? Colors.black : Colors.grey,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  _currentItemSelected = newValue;
                  if (newValue == _listItems[1]) {
                    widget.deliveryPicked("DELIVERY");
                    _haveSelectedItem = true;
                  } else if (newValue == _listItems[2]) {
                    widget.deliveryPicked("MEET");
                    _haveSelectedItem = true;
                  } else {
                    widget.deliveryPicked("NULL");
                    _haveSelectedItem = false;
                  }
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
