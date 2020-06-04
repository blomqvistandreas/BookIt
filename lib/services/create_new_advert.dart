import 'package:bookit_app/functions/upload_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

createAdvert(context, data, image) async {
  var now = new DateTime.now();
  var normalFormat = new DateFormat('yyyy-MM-dd');
  String formattedDate = normalFormat.format(now);
  final databaseReference = Firestore.instance;

  DocumentReference ref = await databaseReference.collection("books").add({
    'date': formattedDate,
    'title': data.title,
    'author': data.author,
    'image': await uploadImage(image),
    'delivery': data.delivery,
    'description': data.description,
    'shipping_agreement': data.shippingAgreement,
    'shipping_cost_creator': data.shippingCostsCreator,
    'shipping_cost_reciever': data.shippingCostsReciever,
    'meet_city': data.meetCity,
    'meet_up_agreement': data.meetUpAgreement,
    'status': "Online",
  });
  print(ref.documentID);
}
