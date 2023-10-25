import 'package:flutter/material.dart';
import 'package:travelapp/pages/nav_pages/HomePage.dart';
import 'package:travelapp/pages/nav_pages/bar_item.dart';
import 'package:travelapp/pages/nav_pages/person.dart';
import 'package:travelapp/pages/nav_pages/search_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    const HomePage(),
    const BarItem(),
    const search(),
    const person(),
  ];

  int selectedIndex = 0;

  void Navigator(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: Navigator,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: 'menu',
              icon: Icon(Icons.apps),
            ),
            BottomNavigationBarItem(
              label: 'chart',
              icon: Icon(Icons.bar_chart),
            ),
            BottomNavigationBarItem(
              label: 'search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'account',
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
