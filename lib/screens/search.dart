import 'package:bookit_app/models/new_book.dart';
import 'package:bookit_app/screens/book_information.dart';
import 'package:bookit_app/utils/dummy_data.dart';
import 'package:bookit_app/widgets/defaults/default_card.dart';
import 'package:bookit_app/widgets/defaults/default_header.dart';
import 'package:bookit_app/widgets/defaults/default_modal.dart';
import 'package:bookit_app/widgets/search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide Colors;

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      onTap: () {
        createDefaultModal(context, BookInformation(data: newBook));
      },
    );
  }

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
        itemCount: dummyTrendingCovers.length,
      ),
    );
  }

  Widget _trendingBookComponent(index) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 6, top: 20),
      decoration: BoxDecoration(
        image: new DecorationImage(
            image: new NetworkImage(dummyTrendingCovers[index]),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }
}
