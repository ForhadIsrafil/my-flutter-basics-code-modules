import 'package:flutter/material.dart';

class TabExamples extends StatefulWidget {
  const TabExamples({super.key});

  @override
  State<TabExamples> createState() => _TabExamplesState();
}

class _TabExamplesState extends State<TabExamples> {
  final _kTabPages = <Widget>[
    const Center(
        child: Icon(
      Icons.cloud,
      size: 100.0,
      color: Colors.teal,
    )),
    const Center(
        child: Icon(
      Icons.alarm,
      size: 62.0,
      color: Colors.redAccent,
    )),
    const Center(
        child: Icon(
      Icons.forum,
      size: 62.0,
      color: Colors.blue,
    ))
  ];
  final _kTabs = <Tab>[
    const Tab(
        icon: Icon(
          Icons.cloud,
          color: Colors.redAccent,
          size: 40.0,
        ),
        text: "Tab1"),
    const Tab(
        icon: Icon(
          Icons.alarm,
          color: Colors.redAccent,
          size: 40.0,
        ),
        text: "Tab2"),
    const Tab(
        icon: Icon(
          Icons.forum,
          color: Colors.redAccent,
          size: 40.0,
        ),
        text: "Tab3")
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabPages.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // title: const Center(
          //     child: Text(
          //   "Appbar Tabs",
          // )),
          backgroundColor: Colors.yellow,
          // If `TabController controller` is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          bottom: TabBar(
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
                shape: BoxShape.rectangle),
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}
