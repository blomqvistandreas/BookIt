import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String firstname, lastname, email, registerdate;
  final DocumentReference reference;

  User(
      {this.reference,
      this.firstname,
      this.lastname,
      this.email,
      this.registerdate});

  User.fromMap(Map<String, dynamic> map, {this.reference})
      : firstname = map['first_name'],
        lastname = map['last_name'],
        email = map['email'],
        registerdate = map['register_date'];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
