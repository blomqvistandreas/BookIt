import 'package:bookit_app/screens/buy.dart';
import 'package:bookit_app/screens/overview.dart';
import 'package:bookit_app/screens/sell.dart';
import 'package:bookit_app/screens/trade.dart';
import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  int currentTab = 0;

  final List<Widget> screens = [
    BuyScreen(),
    SellScreen(),
    TradeScreen(),
    OverviewScreen(),
  ];

  Widget currentScreen = BuyScreen();

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
          print('Open create book page');
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
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    //TODO: Extract these to one component...
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = BuyScreen();
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
                            'Köpa',
                            style: TextStyle(
                                color: currentTab == 0
                                    ? Colors.amber
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = SellScreen();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: currentTab == 1 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Sälja',
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
                padding: EdgeInsets.only(right: 6),
                child: Row(
                  children: [
                    //TODO: Extract these to one component...
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = TradeScreen();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            color: currentTab == 2 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Byta',
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
                          currentScreen = OverviewScreen();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: currentTab == 3 ? Colors.amber : Colors.grey,
                          ),
                          Text(
                            'Översikt',
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
