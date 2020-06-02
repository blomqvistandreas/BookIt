import 'package:bookit_app/functions/displayDeliveryText.dart';
import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/utils/formattedDate.dart';
import 'package:bookit_app/widgets/Defaults/DefaultButton.dart';
import 'package:bookit_app/widgets/defaults/DefaultHeader.dart';
import 'package:bookit_app/widgets/defaults/DefaultSubHeader.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

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
              sendMail('adde-16@hotmail.com', "uganda@123.com");
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  sendMail(toEmail, fromEmail) async {
    String u = "bookit.message@gmail.com";
    String p = "Sommar2020";
    final smtpServer = gmail(u, p);

    //TODO: Alert, asking if you agree on sending your email address to the recipent.
    //TODO: Uppdatera email för användaren.
    //TODO: Current user.
    final message = Message()
      ..from = Address(u)
      ..recipients.add(toEmail)
      ..subject =
          'BookIt App - En ny bytesförfrågan på ${data.title}! - ${formattedDate()}'
      ..text =
          'Det har kommit in ett nytt bytesförslag på ${data.title} av ${data.author}.\nAnvändaren har email adressen: $fromEmail \nSkicka ett email och diskutera vidare!';
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. \n' + e.toString());
    }
  }
}
