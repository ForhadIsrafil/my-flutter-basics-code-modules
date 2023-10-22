import 'package:flutter/material.dart';

class PageSelectorPageExample extends StatefulWidget {
  const PageSelectorPageExample({super.key});

  @override
  State<PageSelectorPageExample> createState() =>
      _PageSelectorPageExampleState();
}

class _PageSelectorPageExampleState extends State<PageSelectorPageExample>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static const kIcons = [
    Icon(
      Icons.event,
      size: 50.0,
    ),
    Icon(
      Icons.home,
      size: 50.0,
    ),
    Icon(
      Icons.android,
      size: 50.0,
    ),
    Icon(
      Icons.alarm,
      size: 50.0,
    ),
    Icon(
      Icons.face,
      size: 50.0,
    ),
    Icon(
      Icons.language,
      size: 50.0,
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: kIcons.length,
      initialIndex: 0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          TabBarView(
            controller: _tabController,
            children: kIcons,
          ),
          Positioned(
              bottom: 40.0,
              child: TabPageSelector(
                controller: _tabController,
                color: Colors.deepPurpleAccent,
                indicatorSize: 30.0,
                selectedColor: Colors.lightGreen,
              )),
          ElevatedButton(
            onPressed: () {
              if (!_tabController.indexIsChanging) {
                _tabController.animateTo(kIcons.length - 1);
                Future.delayed(const Duration(seconds: 2), () {
                  _tabController.animateTo(0);
                });
              }
            },
            child: const Text("Skip"),
          )
        ],
      ),
    );
  }
}
