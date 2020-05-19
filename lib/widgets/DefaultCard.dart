import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  final int index, startIndex;
  final List data;

  const DefaultCard({
    Key key,
    this.index,
    this.startIndex,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    data[startIndex]['image'],
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(width: 20),
          column(startIndex, data),
        ],
      ),
    );
  }
}

Expanded column(startIndex, data) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data[startIndex]['title'],
          style: TextStyle(fontSize: 19),
          overflow: TextOverflow.fade,
          maxLines: 10,
        ),
        Text(
          "By " + data[startIndex]['author'],
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(height: 20),
        Text(
          "• " +
              data[startIndex]['price'] +
              " kr\n" +
              "• Göteborg \n" +
              "• Byta",
        ),
      ],
    ),
  );
}
