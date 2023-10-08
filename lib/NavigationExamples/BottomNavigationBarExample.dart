import 'package:flutter/material.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _currentTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    final kTabPages = [
      const Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
      const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    ];

    final kBottomNavBarItems = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.cloud, color: Colors.lightGreen,), label: 'Tab1', tooltip: 'Tab1'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.alarm, color: Colors.deepPurpleAccent,), label: 'Tab2', tooltip: 'Tab2'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.forum, color: Colors.redAccent,), label: 'Tab3', tooltip: 'Tab3'),
    ];
    assert(kTabPages.length == kBottomNavBarItems.length);

    final bottomNavBar = BottomNavigationBar(
      backgroundColor: Colors.lightGreenAccent,
      fixedColor: Colors.amber,
      items: kBottomNavBarItems,
      // iconSize: 30.0,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.shifting,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(),
      body: kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
