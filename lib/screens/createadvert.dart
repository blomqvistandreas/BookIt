import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/models/new_book_template.dart';
import 'package:bookit_app/widgets/Defaults/DefaultAddImage.dart';
import 'package:bookit_app/widgets/Defaults/DefaultButton.dart';
import 'package:bookit_app/widgets/Defaults/DefaultHeader.dart';
import 'package:bookit_app/widgets/Defaults/DefaultTextField.dart';
import 'package:bookit_app/widgets/DeliveryDropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateAdvert extends StatelessWidget {
  final controllerTitle = TextEditingController();
  final controllerAuthor = TextEditingController();
  NewBookTemplate _newBookTemplate = NewBookTemplate();
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // TODO: Kan vara del utav DefaultHeader, ta in icon / onpress
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
                  _newBookTemplate.title = text;
                },
              ),
              SizedBox(height: 20),
              DefaultTextField(
                label: "Author",
                textInput: (text) {
                  _newBookTemplate.author = text;
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
                    _newBookTemplate.image = image;
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
                _newBookTemplate.delivery = delivery;
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

  createRecord() async {
    /*await databaseReference
        .collection("books")
        .document("potatis")
        .setData({'title': 'potatis', 'description': 'potatis beskrivning'});*/

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    DocumentReference ref = await databaseReference.collection("books").add({
      'date': formattedDate,
      'title': _newBookTemplate.title,
      'author': _newBookTemplate.author,
      'image': _newBookTemplate.image,
      'delivery': _newBookTemplate.delivery,
    });
    print(ref.documentID);
  }
}
