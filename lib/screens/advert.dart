import 'package:flutter/material.dart';
import 'package:bookit_app/widgets/DefaultHeader.dart';

class AdvertScreen extends StatefulWidget {
  @override
  _AdvertScreenState createState() => _AdvertScreenState();
}

class _AdvertScreenState extends State<AdvertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          if (index == 0) return defaultHeader("Mina annonser");
          //else if (index == 1)

          //else if (index == 2)
          //return defaultHeader("Andra böcker");
          //else
          //return _defaultBookComponent(index);
        },
      ),
    );
  }
}
