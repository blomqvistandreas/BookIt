import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/widgets/Defaults/DefaultButton.dart';
import 'package:bookit_app/widgets/defaults/DefaultHeader.dart';
import 'package:bookit_app/widgets/defaults/DefaultSubHeader.dart';
import 'package:flutter/material.dart';

class BookInformation extends StatelessWidget {
  final NewBook data;

  const BookInformation({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultHeader(title: data.title, fontSize: 30),
        DefaultSubHeader(title: "By ${data.author}", fontSize: 15),
        SizedBox(height: 40),
        Image.network(data.image),
        Row(
          children: [
            Icon(Icons.check),
            SizedBox(width: 10),
            Text(data
                .delivery), // Meet up in Göteborg / Fraktas, leverans inom 7 dagar
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButton(title: "Request trade"),
            SizedBox(width: 5),
            DefaultButton(title: "Lägg till i varukorgen"),
          ],
        ),
      ],
    );
  }
}
