import 'package:flutter/material.dart';

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ExpansionTile(
            title: const Text("ExpansionTile"),
            subtitle: const Text('Custom expansion arrow icon'),
            trailing: Icon(_customTileExpanded
                ? Icons.arrow_drop_down_circle
                : Icons.arrow_drop_down),
            children: const [
              ListTile(title: Text('This is tile number 1')),
              ListTile(title: Text('This is tile number 2')),
            ],
            onExpansionChanged: (bool expand) {
              setState(() => _customTileExpanded = expand);
            },
          ),
        ],
      ),
    );
  }
}
