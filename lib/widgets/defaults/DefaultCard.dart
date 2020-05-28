import 'dart:ui';
import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/styles/colors.dart';
import 'package:flutter/material.dart' hide Colors;

class DefaultCard extends StatelessWidget {
  final int index, startIndex;
  final NewBook data;
  final bool hasEnded;
  final String endedText;

  const DefaultCard({
    Key key,
    this.index,
    this.startIndex,
    this.data,
    this.hasEnded = false,
    this.endedText = "SOLD", // SOLD or EXPIRED
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 6, left: 20, right: 20),
          height: 160,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.primary, Colors.secondary]),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(
                  height: 140,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    image: new DecorationImage(
                        image: new NetworkImage(data.image), fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      //data[startIndex]['title'],
                      style: TextStyle(fontSize: 19),
                      overflow: TextOverflow.fade,
                      maxLines: 10,
                    ),
                    Text(
                      //"By " + data[startIndex]['author'],
                      data.author,
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "• " + "600kr" + " kr\n" + "• Göteborg \n" + "• Byta",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        hasEnded
            ? Container(
                margin: EdgeInsets.only(bottom: 6, left: 20, right: 20),
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.65),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              )
            : Container(),
        hasEnded
            ? Container(
                height: 160,
                margin: EdgeInsets.only(bottom: 6, left: 20, right: 20),
                alignment: Alignment.center,
                child: Transform(
                  alignment: FractionalOffset.center,
                  transform: new Matrix4.identity()..rotateZ(-15 * 2.25 / 180),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.primary.withOpacity(0.9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(color: Colors.white, width: 4.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          endedText,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
