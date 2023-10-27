import 'package:flutter/material.dart';

class ListViewBuilderExample extends StatefulWidget {
  const ListViewBuilderExample({super.key});

  @override
  State<ListViewBuilderExample> createState() => _ListViewBuilderExampleState();
}

class _ListViewBuilderExampleState extends State<ListViewBuilderExample> {
  @override
  Widget build(BuildContext context) {
    const numItems = 20;
    const biggerFont = TextStyle(fontSize: 18.0);

    Widget _buildRow(int? idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text("$idx"),
        ),
        title: Text(
          "Item $idx",
          style: biggerFont,
        ),
        trailing: const Icon(Icons.dashboard),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: numItems,
        padding: const EdgeInsets.all(16.0),
        separatorBuilder: (BuildContext context, int i) => const Divider(
          color: Colors.cyan,
        ),
        itemBuilder: (BuildContext context, int i) {
          // if (i.isOdd) {
          //   return const Divider(
          //     color: Colors.blueGrey,
          //   );
          // }
          // final index = i ~/ 2 + 1;
          return _buildRow(i+1);
        },
      ),
    );
  }
}
