import 'package:bookit_app/utils/dummy_data.dart';
import 'package:bookit_app/widgets/defaults/default_header.dart';
import 'package:flutter/material.dart';

class AdvertScreen extends StatefulWidget {
  @override
  _AdvertScreenState createState() => _AdvertScreenState();
}

class _AdvertScreenState extends State<AdvertScreen> {
  var filteredData = dummyData.where((item) => item['author'] == "Ben");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          if (index == 0)
            return DefaultHeader(title: "Mina annonser");
          else
            return DefaultHeader(title: 'Avslutade annonser');
        },
      ),
    );
  }
}
