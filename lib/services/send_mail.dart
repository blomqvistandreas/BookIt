import 'package:bookit_app/utils/formatted_date.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

sendMail(toEmail, fromEmail, data) async {
  String u = "bookit.message@gmail.com";
  String p = "Sommar2020";
  final smtpServer = gmail(u, p);
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
