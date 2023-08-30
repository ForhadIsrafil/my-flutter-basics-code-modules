import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ListTitleExamples extends StatefulWidget {
  const ListTitleExamples({super.key});

  @override
  State<ListTitleExamples> createState() => _ListTitleExamplesState();
}

class _ListTitleExamplesState extends State<ListTitleExamples> {
  @override
  Widget build(BuildContext context) {
    final listTitles = [
      const ListTile(
        title: Text("Tile 0: basic"),
      ),
      const Divider(),
      const ListTile(
        title: Text("Tile 1: with leading/trailing widgets"),
        leading: Icon(Icons.face),
        trailing: Icon(Icons.tag_faces),
      ),
      const Divider(),
      const ListTile(
        title: Text("Tile 2 title'"),
        subtitle: Text("subtitle of tile 2"),
      ),
      const Divider(),
      const ListTile(
        title: Text("Tile 3: 3 lines."),
        isThreeLine: true,
        subtitle: Text("subtitle of tile 3"),
      ),
      const Divider(),
      const ListTile(
        title: Text("Tile 4: dense"),
        dense: true,
      ),
      const Divider(),
      const ListTile(
        title: Text("Tile5: tile with badge"),
        subtitle: Text("(This uses the badges package)"),
        trailing: badges.Badge(
          badgeContent: Text("10"),
          child: Icon(Icons.message, size: 50.0,),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: listTitles,
      ),
    );
  }
}
