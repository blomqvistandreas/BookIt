import 'package:bookit_app/widgets/DefaultAddImage.dart';
import 'package:bookit_app/widgets/DefaultButton.dart';
import 'package:bookit_app/widgets/DefaultDropdown.dart';
import 'package:bookit_app/widgets/DefaultHeader.dart';
import 'package:bookit_app/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

class CreateAdvert extends StatelessWidget {
  final controllerTitle = TextEditingController();
  final controllerAuthor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Kan vara del utav DefaultHeader, ta in icon / onpress
            Padding(
              padding: EdgeInsets.only(top: 20, right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: () {
                    print("Title: ${controllerTitle.text}");
                    print("Author: ${controllerAuthor.text}");
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close),
                ),
              ),
            ),
            DefaultHeader(title: "Skapa annons"),
            DefaultTextField(
              label: "Title",
              controller: controllerTitle,
            ),
            SizedBox(height: 20),
            DefaultTextField(
              label: "Author",
              controller: controllerAuthor,
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
                child: DefaultAddImage(),
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
            DefaultDropdown(),
            SizedBox(height: 40),
            DefaultButton(
              title: "Fortsätt",
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
