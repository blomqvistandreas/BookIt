import 'package:bookit_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//TODO: Montserrat

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookIt',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Book it'),
          backgroundColor: Colors.amber[700],
        ),
        body: Routes(),
      ),
    );
  }
}
