import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/widgets/Defaults/DefaultAddImage.dart';
import 'package:bookit_app/widgets/Defaults/DefaultButton.dart';
import 'package:bookit_app/widgets/Defaults/DefaultHeader.dart';
import 'package:bookit_app/widgets/Defaults/DefaultTextField.dart';
import 'package:bookit_app/widgets/DeliveryDropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:intl/intl.dart';

class CreateAdvert extends StatefulWidget {
  @override
  _CreateAdvertState createState() => _CreateAdvertState();
}

class _CreateAdvertState extends State<CreateAdvert> {
  final controllerTitle = TextEditingController();

  final controllerAuthor = TextEditingController();

  NewBook _newBook = NewBook();

  final databaseReference = Firestore.instance;

  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.close),
                  ),
                ),
              ),
              DefaultHeader(title: "Skapa annons"),
              DefaultTextField(
                label: "Title",
                textInput: (text) {
                  _newBook.title = text;
                },
              ),
              SizedBox(height: 20),
              DefaultTextField(
                label: "Author",
                textInput: (text) {
                  _newBook.author = text;
                },
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lägg till en bild",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: DefaultAddImage(imagePicked: (image) {
                    _image = image;
                  }),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Leverans",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DeliveryDropdown(deliveryPicked: (delivery) {
                _newBook.delivery = delivery;
              }),
              SizedBox(height: 40),
              DefaultButton(
                title: "Fortsätt",
                onPressed: () {
                  //TODO: If successful, Check om man fyllt i allting, annars vibrerar ett fält.
                  createRecord();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<String> _uploadImage(File image) async {
    var uuid = new Uuid();
    StorageReference reference =
        FirebaseStorage.instance.ref().child('images/${uuid.v1()}');
    StorageUploadTask uploadTask = reference.putFile(image);

    StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);

    String location = (await downloadUrl.ref.getDownloadURL());
    print("URL: $location");
    return location;
  }

  createRecord() async {
    // Lägg till tid också
    var now = new DateTime.now();
    var normalFormat = new DateFormat('yyyy-MM-dd');
    String formattedDate = normalFormat.format(now);

    DocumentReference ref = await databaseReference.collection("books").add({
      'date': formattedDate,
      'title': _newBook.title,
      'author': _newBook.author,
      'image': await _uploadImage(_image),
      'delivery': _newBook.delivery,
    });
    print(ref.documentID);
  }
}
