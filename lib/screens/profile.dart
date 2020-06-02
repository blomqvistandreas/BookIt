import 'package:bookit_app/widgets/defaults/DefaultAddImage.dart';
import 'package:bookit_app/widgets/defaults/DefaultButton.dart';
import 'package:bookit_app/widgets/defaults/DefaultHeader.dart';
import 'package:bookit_app/widgets/defaults/DefaultTextField.dart';
import 'package:flutter/material.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        DefaultHeader(
          title: "Min profil",
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Align(alignment: Alignment.center, child: DefaultAddImage()),
            ),
          ),
        ),
        Container(
          height: 200,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultTextField(
                  label: "Förnamn",
                ),
                SizedBox(height: 5),
                DefaultTextField(
                  label: "Efternamn",
                ),
                SizedBox(height: 5),
                DefaultTextField(
                  label: "Email",
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DefaultButton(
            title: "Spara",
            onPressed: () {
              print("cache");
            },
          ),
        ),
      ],
    ));
  }
}
