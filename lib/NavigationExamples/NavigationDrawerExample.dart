import 'package:flutter/material.dart';

class NavigationDrawerExample extends StatefulWidget {
  const NavigationDrawerExample({super.key});

  @override
  State<NavigationDrawerExample> createState() =>
      _NavigationDrawerExampleState();
}

class _NavigationDrawerExampleState extends State<NavigationDrawerExample> {
  @override
  Widget build(BuildContext context) {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text("Forhad"),
      accountEmail: Text("forhad@gmail.com"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent,
        child: FlutterLogo(
          size: 42.0,
        ),
      ),
      otherAccountsPictures: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text("A"),
        ),
        CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Text("B"),
        )
      ],
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: const Text("To page 1"),
          onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        const Divider(
          thickness: 1.0,
          color: Colors.teal,
        ),
        ListTile(
          title: const Text('To page 2'),
          onTap: () => Navigator.of(context).push(_NewPage(2)),
        ),
        ListTile(
          title: const Text('other drawer item'),
          onTap: () {},
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Example"),
        backgroundColor: Colors.amber,
      ),
      body: const Center(
        child: Text('Swipe or click upper-left icon to see drawer.'),
      ),
      drawer: Drawer(
        child: drawerItems,
      ),
    );
  }
}

// <void> means this route returns nothing.
class _NewPage extends MaterialPageRoute {
  _NewPage(int id)
      : super(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: Text("page $id"),
                elevation: 2.0,
              ),
              body: Text("page $id"),
            );
          },
        );
}
