import 'dart:io';

import 'package:flutter/material.dart' hide Colors;

import '../../functions/submitted_all_fields.dart';
import '../../models/new_book.dart';
import '../../services/create_new_advert.dart';
import '../../widgets/defaults/default_add_image.dart';
import '../../widgets/defaults/default_button.dart';
import '../../widgets/defaults/default_header.dart';
import '../../widgets/defaults/default_textfield.dart';
import '../../widgets/delivery_dropdown.dart';
import '../../widgets/multiline_textfield.dart';
import 'delivery_form.dart';
import 'meet_form.dart';

class CreateAdvert extends StatefulWidget {
  @override
  _CreateAdvertState createState() => _CreateAdvertState();
}

class _CreateAdvertState extends State<CreateAdvert> {
  final controllerTitle = TextEditingController();
  final controllerAuthor = TextEditingController();
  NewBook _newBook = NewBook();
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
        _displayDeliveryForm
            ? DeliveryForm(
                shippingAgreement: (value) {
                  _newBook.shippingAgreement = value;
                },
                shippingCostsReciever: (value) {
                  _newBook.shippingCostsReciever = value;
                },
                shippingCostsCreater: (value) {
                  _newBook.shippingCostsCreator = value;
                },
              )
            : Container(),
        _displayMeetUpForm
            ? MeetForm(
                textInput: (text) {
                  _newBook.meetCity = text;
                },
                meetUpAgreement: (value) {
                  _newBook.meetUpAgreement = value;
                },
              )
            : Container(),
        SizedBox(height: 40),
        DefaultButton(
          title: "Fortsätt",
          horizontalPadding: 20.0,
          onPressed: () {
            submittedAllFields(
              context,
              _newBook,
              _image,
              createAdvert(context, _newBook, _image),
            );
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
}
