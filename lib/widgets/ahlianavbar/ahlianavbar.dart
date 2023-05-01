import 'package:au_events_registration/constants/colors.dart';
import 'package:au_events_registration/views/events.dart';
import 'package:au_events_registration/views/help.dart';
import 'package:au_events_registration/views/homescreen.dart';
import 'package:au_events_registration/widgets/ahliawebview/ahliawebview.dart';
import 'package:flutter/material.dart';

class AhliaNavBar extends StatefulWidget {
  const AhliaNavBar({super.key});

  @override
  State<AhliaNavBar> createState() => _AhliaNavBarState();
}

class _AhliaNavBarState extends State<AhliaNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Homescreen(),
    Events(),
    AhliaWebSite(),
    Help(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'Website',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ahliaRed,
        onTap: _onItemTapped,
      ),
    );
  }
}
