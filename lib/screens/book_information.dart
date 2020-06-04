import 'package:bookit_app/functions/display_delivery_text.dart';
import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/services/send_mail.dart';
import 'package:bookit_app/widgets/defaults/default_button.dart';
import 'package:bookit_app/widgets/defaults/default_header.dart';
import 'package:bookit_app/widgets/defaults/default_sub_header.dart';
import 'package:flutter/material.dart';

class BookInformation extends StatelessWidget {
  final NewBook data;

  BookInformation({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultHeader(title: data.title, fontSize: 30),
        DefaultSubHeader(title: "By ${data.author}", fontSize: 15),
        SizedBox(height: 40),
        Image.network(data.image),
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
              sendMail('adde-16@hotmail.com', "uganda@123.com", data);
              Navigator.of(context).pop();
              //När den är såld: newBook.reference.updateData({'status': "Sold"});
            },
          ),
        ),
      ],
    );
  }
}
