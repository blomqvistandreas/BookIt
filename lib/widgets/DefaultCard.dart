import 'package:flutter/material.dart';
import 'package:bookit_app/utils/dummyData.dart';

Container defaultCard(index) {
  var resetIndex = index - 3;
  return Container(
    margin: EdgeInsets.only(bottom: 6, left: 20, right: 20),
    height: 160,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.amber, Colors.yellow[600]]),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      color: Colors.amber,
    ),
    child: Row(
      children: [
        SizedBox(width: 10),
        Container(
          height: 140,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            image: new DecorationImage(
                image: new NetworkImage(
                  dummyData[resetIndex]['image'],
                ),
                fit: BoxFit.fill),
          ),
        ),
        SizedBox(width: 20),
        column(resetIndex),
      ],
    ),
  );
}

Expanded column(resetIndex) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dummyData[resetIndex]['title'],
          style: TextStyle(fontSize: 19),
          overflow: TextOverflow.fade,
          maxLines: 10,
        ),
        // Author
        Text(
          "By " + dummyData[resetIndex]['author'],
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(height: 20),
        Text(
          "• " +
              dummyData[resetIndex]['price'] +
              " kr\n" +
              "• Göteborg \n" +
              "• Byta",
        ),
      ],
    ),
  );
}
