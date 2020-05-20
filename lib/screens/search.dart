import 'package:bookit_app/widgets/DefaultHeader.dart';
import 'package:flutter/material.dart';
import 'package:bookit_app/widgets/DefaultCard.dart';
import 'package:bookit_app/utils/dummyData.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _dummyTrendingCovers = <String>[
    'https://i.harperapps.com/covers/9780062413666/x300.jpg',
    'https://i.harperapps.com/covers/9780061560903/x300.jpg',
    'https://i.harperapps.com/covers/9780061173721/x300.jpg',
    'https://i.harperapps.com/covers/9781557049971/x300.jpg',
    'https://i.harperapps.com/covers/9780062206954/x300.jpg',
    'https://i.harperapps.com/covers/9780062269003/x300.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    var _returningWidgetsAmount = 3;
    return Scaffold(
      body: ListView.builder(
        itemCount: dummyData.length + _returningWidgetsAmount,
        itemBuilder: (context, index) {
          if (index == 0)
            return DefaultHeader(title: "Populära");
          else if (index == 1)
            return _horizontalListView();
          else if (index == 2)
            return DefaultHeader(title: "Andra böcker");
          else
            return DefaultCard(
              index: index,
              startIndex: index - _returningWidgetsAmount,
              data: dummyData,
            );
        },
      ),
    );
  }

  Widget _horizontalListView() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => _trendingBookComponent(index),
        itemCount: _dummyTrendingCovers.length,
      ),
    );
  }

  Widget _trendingBookComponent(index) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        image: new DecorationImage(
            image: new NetworkImage(_dummyTrendingCovers[index]),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
