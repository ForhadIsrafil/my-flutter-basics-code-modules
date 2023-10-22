import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

const _kPages = <String, IconData>{
  'Home': Icons.home,
  'Map': Icons.map,
  'Add': Icons.add,
  'Message': Icons.message,
  'People': Icons.people,
};

class ConvexAppBarExample extends StatefulWidget {
  const ConvexAppBarExample({super.key});

  @override
  State<ConvexAppBarExample> createState() => _ConvexAppBarState();
}

class _ConvexAppBarState extends State<ConvexAppBarExample> {
  TabStyle _tapStyle = TabStyle.reactCircle;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            _buildStyleSelector(),
            const Divider(
              thickness: 1,
              color: Colors.teal,
            ),
            Expanded(
                child: TabBarView(
              children: [
                for (final icon in _kPages.values)
                  Icon(
                    icon,
                    size: 80.0,
                  )
              ],
            )),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          style: _tapStyle,
          items: [
            for (final entry in _kPages.entries)
              TabItem(icon: entry.value, title: entry.key)
          ],
          onTap: (int i) => print("click index$i"),
          backgroundColor: Colors.teal,
        ),
      ),
    );
  }

  // Select style enum from dropdown menu:
  Widget _buildStyleSelector() {
    final dropdown = DropdownButton<TabStyle>(
        value: _tapStyle,
        onChanged: (newTab) {
          if (newTab != null) setState(() => _tapStyle = newTab);
        },
        items: [
          for (final style in TabStyle.values)
            DropdownMenuItem(
                value: style,
                child: Text(
                  style.toString(),
                ))
        ]);

    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      title: const Text("appbar style"),
      trailing: dropdown,
    );
  }
}
