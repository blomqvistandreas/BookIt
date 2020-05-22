import 'package:bookit_app/screens/advert.dart';
import 'package:bookit_app/screens/createadvert.dart';
import 'package:bookit_app/screens/notification.dart';
import 'package:bookit_app/screens/profile.dart';
import 'package:bookit_app/screens/search.dart';
import 'package:bookit_app/widgets/Defaults/DefaultDialog.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:bookit_app/styles/colors.dart';

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  int currentTab = 0;

  final List<Widget> screens = [
    SearchScreen(),
    AdvertScreen(),
    NotificationScreen(),
    ProfileScreen(),
    CreateAdvert(),
  ];

  Widget currentScreen = SearchScreen();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: buildFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomAppBar(),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        createDefaultDialog(context, CreateAdvert());
      },
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  buildMaterialButton("Sök", Icons.search, 0, SearchScreen()),
                  buildMaterialButton("Annonser", Icons.format_list_bulleted, 1,
                      AdvertScreen()),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  buildMaterialButton(
                      "Notiser", Icons.notifications, 2, NotificationScreen()),
                  buildMaterialButton(
                      "Profil", Icons.person, 3, ProfileScreen()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  MaterialButton buildMaterialButton(title, icon, currentTabNum, destination) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          currentScreen = destination;
          currentTab = currentTabNum;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentTab == currentTabNum
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
          Text(
            title,
            style: TextStyle(
                color: currentTab == currentTabNum
                    ? Theme.of(context).primaryColor
                    : Colors.grey),
          )
        ],
      ),
    );
  }
}
