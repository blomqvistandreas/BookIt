import 'package:bookit_app/widgets/DefaultTextField.dart';
import 'package:flutter/material.dart';

class CreateAdvert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Kan vara del utav DefaultHeader, ta in icon / onpress
        FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.close),
        ),
      ],
    );
  }
}
