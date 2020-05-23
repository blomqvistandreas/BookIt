import 'package:bookit_app/models/new_advert.dart';
import 'package:bookit_app/widgets/Defaults/DefaultAddImage.dart';
import 'package:bookit_app/widgets/Defaults/DefaultButton.dart';
import 'package:bookit_app/widgets/Defaults/DefaultHeader.dart';
import 'package:bookit_app/widgets/Defaults/DefaultTextField.dart';
import 'package:bookit_app/widgets/DeliveryDropdown.dart';
import 'package:flutter/material.dart';

class CreateAdvert extends StatelessWidget {
  final controllerTitle = TextEditingController();
  final controllerAuthor = TextEditingController();
  String _passedImage;
  NewAdvert _newAdvert = NewAdvert();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                _newAdvert.title = text;
              },
            ),
            SizedBox(height: 20),
            DefaultTextField(
              label: "Author",
              textInput: (text) {
                _newAdvert.author = text;
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
                  _newAdvert.image = image;
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
              _newAdvert.delivery = delivery;
            }),
            SizedBox(height: 40),
            DefaultButton(
              title: "Fortsätt",
              onPressed: () {
                //TODO: Check om man fyllt i allting, annars vibrerar ett fält.
                print("Title: ${_newAdvert.title}");
                print("Author: ${_newAdvert.author}");
                print("Picture/URL: ${_newAdvert.image}");
                print("Delivery: ${_newAdvert.delivery}");
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
