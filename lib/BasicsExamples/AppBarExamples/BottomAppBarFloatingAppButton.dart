import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomAppBarFloatingAppButton extends StatefulWidget {
  const BottomAppBarFloatingAppButton({super.key});

  @override
  State<BottomAppBarFloatingAppButton> createState() =>
      _BottomAppBarFloatingAppButtonState();
}

class _BottomAppBarFloatingAppButtonState
    extends State<BottomAppBarFloatingAppButton> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;
  bool _isBottomBarNotched = false;
  bool _isFabMini = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      key: scaffoldKey,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            title: const Text('FloatingActionButton position:'),
            trailing: DropdownButton<FloatingActionButtonLocation>(
              value: _fabLocation,
              onChanged: (FloatingActionButtonLocation? newval) {
                if (newval != null) {
                  setState(() => _fabLocation = newval);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerFloat,
                  child: Text('centerFloat'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.endFloat,
                  child: Text('endFloat'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerDocked,
                  child: Text('centerDocked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.endDocked,
                  child: Text('endDocked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.miniStartTop,
                  child: Text('miniStartTop'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.startTop,
                  child: Text('startTop'),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Mini FAB:'),
            trailing: Switch(
              value: _isFabMini,
              onChanged: (bool val) {
                setState(() => _isFabMini = val);
              },
            ),
          ),
          ListTile(
            title: const Text('BottomAppBar notch:'),
            trailing: Switch(
              value: _isBottomBarNotched,
              onChanged: (bool val) {
                print(val);
                setState(() => _isBottomBarNotched = val);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: _isFabMini,
        onPressed: () {
          Fluttertoast.showToast(msg: 'Dummy floating action button');
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: _buildBottomAppBar(context),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: _isBottomBarNotched ? const CircularNotchedRectangle() : null,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          // IconButton(
          //   onPressed: () => showBottomSheet(
          //     context: context,
          //     builder: (BuildContext context) => Container(
          //       alignment: Alignment.center,
          //       height: 200,
          //       child: const Text('Dummy bottom sheet'),
          //     ),
          //   ),
          //   icon: const Icon(Icons.menu),
          // ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () =>
                Fluttertoast.showToast(msg: 'Dummy search action.'),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => Fluttertoast.showToast(msg: 'Dummy menu action.'),
          ),
        ],
      ),
    );
  }
}
