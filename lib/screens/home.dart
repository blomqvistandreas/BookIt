import 'package:bookit_app/screens/advert.dart';
import 'package:bookit_app/screens/createadvert.dart';
import 'package:bookit_app/screens/notification.dart';
import 'package:bookit_app/screens/profile.dart';
import 'package:bookit_app/screens/search.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.amber[700],
        onPressed: () {
          setState(() {
            currentScreen = CreateAdvert();
            currentTab = 5;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
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
                    //TODO: Extract these to one component...
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = SearchScreen();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: currentTab == 0 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Sök',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Colors.amber
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = AdvertScreen();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.format_list_bulleted,
                            color: currentTab == 1 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Annonser',
                            style: TextStyle(
                                color: currentTab == 1
                                    ? Colors.amber
                                    : Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    //TODO: Extract these to one component...
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = NotificationScreen();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications,
                            color: currentTab == 2 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Notiser',
                            style: TextStyle(
                                color: currentTab == 2
                                    ? Colors.amber
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = ProfileScreen();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab == 3 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Profil',
                            style: TextStyle(
                                color: currentTab == 3
                                    ? Colors.amber
                                    : Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
