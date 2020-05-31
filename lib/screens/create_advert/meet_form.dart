import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

Container buildMeetForm() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 30),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      border: Border.all(
        width: 2.0,
        color: Colors.grey,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
              "Alert icon: Röd text, Att mötas upp sker på egen risk, vi rekommenderar att ALLTID träffas på offentlig plats."),
          Text(
              "Du har valt att mötas upp för att byta din bok, här väljer du vart träffen skall äga rum."),
          Text(""),
          Text("I vilken stad kan du mötas upp?"),
          Text("När är du tillgänglig?"),
          Text("5"),
        ],
      ),
    ),
  );
}
