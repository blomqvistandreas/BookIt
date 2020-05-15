import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

//TODO: Overflowing text!

class _SearchScreenState extends State<SearchScreen> {
  final List<String> items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
  ];

  final List<String> _dummyBookTitles = <String>[
    'End the Ocean',
    'Hijas Sur',
    'Corporate: Gunslinger',
    'Chaos reigning',
    'Polaris rising',
    'Aurora blazing',
    'Cold between',
    'Executive intent',
    'Shadow command',
    'Arthur christmas',
    'Tom Felsom: Hopper',
  ];

  final List<String> _dummyBookPrice = <String>[
    '650',
    '375',
    '499',
    '299',
    '170',
    '800',
    '230',
    '99',
    '400',
    '120',
    '399',
  ];

  final List<String> _dummyBookCovers = <String>[
    'https://i.harperapps.com/covers/9780062951366/x300.jpg',
    'https://i.harperapps.com/covers/9788491393900/x300.jpg',
    'https://i.harperapps.com/covers/9780062897688/x300.jpg',
    'https://i.harperapps.com/covers/9780062802439/x300.jpg',
    'https://i.harperapps.com/covers/9780062802408/x300.jpg',
    'https://i.harperapps.com/covers/9780062802460/x300.jpg',
    'https://i.harperapps.com/covers/9780062413666/x300.jpg',
    'https://i.harperapps.com/covers/9780061560903/x300.jpg',
    'https://i.harperapps.com/covers/9780061173721/x300.jpg',
    'https://i.harperapps.com/covers/9781557049971/x300.jpg',
    'https://i.harperapps.com/covers/9780062206954/x300.jpg',
    'https://i.harperapps.com/covers/9780062269003/x300.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _dummyBookCovers.length + 2,
        itemBuilder: (context, index) {
          if (index == 0)
            return _defaultTitleContainer("Populära");
          else if (index == 1)
            return _horizontalListView();
          else if (index == 2)
            return _defaultTitleContainer("Andra böcker");
          else
            return _defaultBookComponent(index);
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
        itemCount: _dummyBookCovers.length,
      ),
    );
  }

  Widget _defaultTitleContainer(String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      height: 100,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _trendingBookComponent(index) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        image: new DecorationImage(
            image: new NetworkImage(_dummyBookCovers[index]), fit: BoxFit.fill),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

//margin: EdgeInsets.symmetric(horizontal: 12),
  Widget _defaultBookComponent(index) {
    var resetIndex = index - 3;
    return Container(
      margin: EdgeInsets.only(bottom: 6, left: 20, right: 20),
      height: 160,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.amber, Colors.yellow[600]]),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.amber,
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Container(
            height: 140,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: new DecorationImage(
                  image: new NetworkImage(_dummyBookCovers[resetIndex]),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(width: 20),
          column(resetIndex),
        ],
      ),
    );
  }

  Column column(resetIndex) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _dummyBookTitles[resetIndex],
          style: TextStyle(fontSize: 19),
          overflow: TextOverflow.fade,
          maxLines: 10,
        ),
        // Author
        Text(
          "By Andreas Blomqvist",
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(height: 20),
        Text(
          "• " +
              _dummyBookPrice[resetIndex] +
              " kr\n" +
              "• Göteborg \n" +
              "• Byta",
        ),
      ],
    );
  }
}
