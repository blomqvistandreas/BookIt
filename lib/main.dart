import 'package:bookit_app/bottom_navbar.dart';
import 'package:bookit_app/screens/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookIt',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Book it'),
          //iconTheme: Icon(Icons.school),
          backgroundColor: Colors.amber[700],
        ),
        body: Routes(),
      ),
    );
  }
}
