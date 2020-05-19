import 'package:bookit_app/widgets/DefaultDialog.dart';
import 'package:flutter/material.dart';

class CreateAdvert extends StatefulWidget {
  @override
  _CreateAdvertState createState() => _CreateAdvertState();
}

class _CreateAdvertState extends State<CreateAdvert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DefaultDialog(),
        ],
      ),
    );
  }
}
