import 'package:bookit_app/screens/home.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:bookit_app/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      runApp(
        MyApp(),
      )
    };

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );*/

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookIt',
      theme: buildThemeData(context),
      home: Scaffold(
        /*appBar: AppBar(
          title: Text('BookIt', style: Theme.of(context).textTheme.headline),
          brightness: Theme.of(context).brightness,
        ),*/
        body: Routes(),
      ),
    );
  }

  ThemeData buildThemeData(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(textTheme),
      primaryColor: Colors.primary,
      hintColor: Colors.grey,
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.primary),
    );
  }
}
