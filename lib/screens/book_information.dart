import 'package:bookit_app/functions/displayDeliveryText.dart';
import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/utils/snackbar.dart';
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
        // TODO: Mer info om användare när det finns
        // Rund avatar, användarnamn, BookIt trust score
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "- ${data.description}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check),
            SizedBox(width: 5),
            Text(data.delivery),
            displayDeliveryText(data),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DefaultButton(
            title: "Skicka bytesförfrågan",
            onPressed: () {
              createSnackBar(context, "Förfrågan skickad");
            },
          ),
        ),
      ],
    );
  }
}
