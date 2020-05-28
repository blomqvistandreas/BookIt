import 'package:bookit_app/widgets/Defaults/DefaultHeader.dart';
import 'package:flutter/material.dart';
import 'package:bookit_app/utils/dummyData.dart';

class AdvertScreen extends StatefulWidget {
  @override
  _AdvertScreenState createState() => _AdvertScreenState();
}

class _AdvertScreenState extends State<AdvertScreen> {
  //TODO: Filtering my books? Create a list when adding new advert?
  var filteredData = dummyData.where((item) => item['author'] == "Ben");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1 + 2,
        itemBuilder: (context, index) {
          if (index == 0)
            return DefaultHeader(title: "Mina annonser");
          /*else if (index == 1)
            return DefaultCard(
                index: index, startIndex: index - 1, data: dummyData);*/
          else
            return DefaultHeader(title: 'Avslutade annonser');
        },
      ),
    );
  }
}
