import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/styles/colors.dart';
import 'package:bookit_app/widgets/Defaults/DefaultCard.dart';
import 'package:bookit_app/widgets/Defaults/DefaultHeader.dart';
import 'package:bookit_app/widgets/SearchBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide Colors;
import 'dart:io';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  File _image;
  String _uploadedFileURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SearchBar(),
          ),
          SliverToBoxAdapter(
            child: DefaultHeader(title: "Populära"),
          ),
          SliverToBoxAdapter(
            child: _horizontalListView(),
          ),
          SliverToBoxAdapter(
            child: DefaultHeader(title: "Andra böcker"),
          ),
          SliverToBoxAdapter(
            child: _buildBody(context),
          ),
        ],
      ),
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
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
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
  }

  /*
        child: ListTile(
          title: Text(newBook.title),
          trailing: Text(newBook.delivery),
          onTap: () => newBook.reference.updateData({'delivery': "Sell"}),
    */

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
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          if (index == 0) {
            return SizedBox(width: 20);
          } else {
            return _trendingBookComponent(index);
          }
        },
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
