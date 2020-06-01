import 'package:cloud_firestore/cloud_firestore.dart';

class NewBook {
  String title, author, image, delivery, description, status, meetCity;
  final DocumentReference reference;
  bool shippingAgreement, userPayDeliveryCosts;

  NewBook(
      {this.reference,
      this.title,
      this.author,
      this.image,
      this.delivery,
      this.description,
      this.shippingAgreement,
      this.userPayDeliveryCosts,
      this.meetCity,
      this.status});

  NewBook.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['author'] != null),
        assert(map['image'] != null),
        assert(map['delivery'] != null),
        assert(map['description'] != null),
        title = map['title'],
        author = map['author'],
        image = map['image'],
        delivery = map['delivery'],
        description = map['description'],
        shippingAgreement = map['shipping_agreement'],
        userPayDeliveryCosts = map['user_pay_delivery_costs'],
        meetCity = map['meet_city'],
        status = map['status'];

  NewBook.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
