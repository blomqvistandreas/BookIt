import 'dart:io';
import 'package:bookit_app/screens/create_advert/delivery_form.dart';
import 'package:bookit_app/screens/create_advert/meet_form.dart';
import 'package:bookit_app/styles/colors.dart';
import 'package:bookit_app/utils/snackbar.dart';
import 'package:bookit_app/widgets/MultilineTextField.dart';
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

  var _displayMeetUpForm = false;
  var _displayDeliveryForm = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultHeader(title: "Skapa annons"),
        SizedBox(height: 20),
        buildTitleTextField(),
        SizedBox(height: 10),
        buildAuthorTextField(),
        SizedBox(height: 10),
        MultilineTextField(
          label: "Beskrivning",
          textInput: (text) {
            _newBook.description = text;
          },
        ),
        SizedBox(height: 20),
        buildSubHeader(text: "Lägg till en bild"),
        SizedBox(height: 20),
        buildAddImage(),
        SizedBox(height: 20),
        buildSubHeader(text: "Leverans"),
        SizedBox(height: 20),
        buildDeliveryDropdown(),
        SizedBox(height: 40),
        _displayDeliveryForm ? DeliveryForm() : Container(),
        _displayMeetUpForm
            ? MeetForm(
                textInput: (text) {
                  _newBook.meetCity = text;
                },
              )
            : Container(),
        SizedBox(height: 40),
        DefaultButton(
          title: "Fortsätt",
          horizontalPadding: 20.0,
          onPressed: () {
            submittedAllFields();
          },
        ),
      ],
    );
  }

  Padding buildAddImage() {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DefaultAddImage(imagePicked: (image) {
          _image = image;
        }),
      ),
    );
  }

  DeliveryDropdown buildDeliveryDropdown() {
    return DeliveryDropdown(deliveryPicked: (delivery) {
      setState(() {
        if (delivery == "DELIVERY") {
          _displayMeetUpForm = false;
          _displayDeliveryForm = true;
          _newBook.delivery = delivery;
        } else if (delivery == "MEET") {
          _displayDeliveryForm = false;
          _displayMeetUpForm = true;
          _newBook.delivery = delivery;
        } else {
          _newBook.delivery = delivery;
          _displayDeliveryForm = false;
          _displayMeetUpForm = false;
          print("Error: 8301");
        }
      });
    });
  }

  Padding buildSubHeader({String text}) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  DefaultTextField buildAuthorTextField() {
    return DefaultTextField(
      label: "Author",
      textInput: (text) {
        _newBook.author = text;
      },
    );
  }

  DefaultTextField buildTitleTextField() {
    return DefaultTextField(
      label: "Title",
      textInput: (text) {
        _newBook.title = text;
      },
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

  submittedAllFields() {
    if (_newBook.title != null &&
        _newBook.author != null &&
        _newBook.description != null &&
        _image != null) {
      if (_newBook.delivery == "DELIVERY") {
        if (_newBook.userPayDeliveryCosts != null &&
            _newBook.shippingAgreement != null) {
          createSnackBar(context, "Yes, delivery");
          createAdvert();
        }
      } else if (_newBook.delivery == "MEET") {
        //createSnackBar(context, "Yes, meet");
      } else {
        createSnackBar(context, "Missing information");
      }
    } else {
      createSnackBar(context, "Missing information");
    }
  }

  createRecord() async {
    var now = new DateTime.now();
    var normalFormat = new DateFormat('yyyy-MM-dd');
    String formattedDate = normalFormat.format(now);

    DocumentReference ref = await databaseReference.collection("books").add({
      'date': formattedDate,
      'title': _newBook.title,
      'author': _newBook.author,
      'image': await _uploadImage(_image),
      'delivery': _newBook.delivery,
      'description': _newBook.description,
    });
    print(ref.documentID);
  }

  createAdvert() {
    _newBook.status = "Online";
    createRecord();
    Navigator.of(context).pop();
  }
}
