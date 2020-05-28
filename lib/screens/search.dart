import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/styles/colors.dart';
import 'package:bookit_app/widgets/Defaults/DefaultCard.dart';
import 'package:bookit_app/widgets/Defaults/DefaultHeader.dart';
import 'package:bookit_app/widgets/SearchBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:bookit_app/utils/dummyData.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  File _image;
  String _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    var _returningWidgetsAmount = 4;
    return Scaffold(
      body: _buildBody(context),
      /*ListView.builder(
        itemCount: dummyData.length + _returningWidgetsAmount,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SearchBar();
          } else if (index == 1)
            return DefaultHeader(title: "Populära");
          else if (index == 2)
            return _horizontalListView();
          else if (index == 3)
            return DefaultHeader(title: "Andra böcker");
          else
            return DefaultCard(
              index: index,
              startIndex: index - _returningWidgetsAmount,
              data: dummyData,
            );
        },
      ),*/
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('books').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        print(snapshot.data.documents);
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final newBook = NewBook.fromSnapshot(data);

    return DefaultCard(
      key: ValueKey(newBook.title),
      data: newBook,
    );

    /*Padding(
      key: ValueKey(newBook.title),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(newBook.title),
          trailing: Text(newBook.delivery),
          onTap: () => newBook.reference.updateData({'delivery': "Sell"}),
        ),
      ),
    );*/
  }

  final List<String> _dummyTrendingCovers = <String>[
    'https://i.harperapps.com/covers/9780062413666/x300.jpg',
    'https://i.harperapps.com/covers/9780061560903/x300.jpg',
    'https://i.harperapps.com/covers/9780061173721/x300.jpg',
    'https://i.harperapps.com/covers/9781557049971/x300.jpg',
    'https://i.harperapps.com/covers/9780062206954/x300.jpg',
    'https://i.harperapps.com/covers/9780062269003/x300.jpg'
  ];

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
