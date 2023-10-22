import 'package:flutter/material.dart';

class BottomTabBarExample extends StatefulWidget {
  const BottomTabBarExample({super.key});

  @override
  State<BottomTabBarExample> createState() => _BottomTabBarExampleState();
}

class _BottomTabBarExampleState extends State<BottomTabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  static const kTabPages = [
    Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
  ];
  static const kTabs = [
    Tab(icon: Icon(Icons.cloud), text: "Tab1"),
    Tab(icon: Icon(Icons.alarm), text: "Tab2"),
    Tab(icon: Icon(Icons.forum), text: "Tab3"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController =
        TabController(initialIndex: 1, length: kTabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TabBarView(controller: tabController, children: kTabPages),
      bottomNavigationBar: Material(
        // elevation: 10.0,
        color: Colors.indigo,
        child: TabBar(
          unselectedLabelColor: Colors.white24,
          indicatorColor: Colors.lightGreenAccent,
          tabAlignment: TabAlignment.startOffset,
          isScrollable: true,
          indicatorWeight: 5.0,
          tabs: kTabs,
          controller: tabController,
        ),
      ),
    );
  }
}
