import 'package:cloud_firestore/cloud_firestore.dart';

class NewBook {
  String title, author, image, delivery;
  final DocumentReference reference;

  NewBook({
    this.reference,
    this.title,
    this.author,
    this.image,
    this.delivery,
  });

  NewBook.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['author'] != null),
        assert(map['image'] != null),
        assert(map['delivery'] != null),
        title = map['title'],
        author = map['author'],
        image = map['image'],
        delivery = map['delivery'];

  NewBook.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
