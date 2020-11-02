import 'package:flutter/material.dart';
import 'package:rentworker/BookingScreen/booking_screen.dart';
import 'package:rentworker/InfoPage/info_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    BookingScreen(),
    BookingScreen(),
    InfoScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: new Text("Posting")),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), title: new Text("Booking")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: new Text("Profile")),
          ]),
      //AntDesign.plussquare
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
