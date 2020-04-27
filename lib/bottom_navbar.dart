import 'package:flutter/material.dart';

//TODO: Find color scheme
// New color = 	#FF9900

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Köpa'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          title: Text('Sälja'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.cached),
          title: Text('Byta'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          title: Text('Översikt'),
        ),
      ],
      currentIndex: _selectedIndex,
      showUnselectedLabels: true,
      selectedItemColor: Colors.amber[700],
      unselectedItemColor: Colors.amber[500],
      onTap: _onItemTapped,
    );
  }
}
