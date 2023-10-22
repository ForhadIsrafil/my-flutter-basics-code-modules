import 'dart:core';
import 'package:flutter/material.dart';

class DropdownExamples extends StatefulWidget {
  const DropdownExamples({super.key});

  @override
  State<DropdownExamples> createState() => _DropdownExamplesState();
}

class _DropdownExamplesState extends State<DropdownExamples> {
  static const _menuItems = <String>["One", "Two", "Three", "Four"];

  final _dropMenuItems = _menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  final _popUpMenuItems = _menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  String _btn1SelectedVal = "One";
  String? _btn2SelectedVal;
  late String _btn3SelectedVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            title: const Text('DropDownButton with default:'),
            trailing: DropdownButton<String>(
              items: _dropMenuItems,
              value: _btn1SelectedVal,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() => _btn1SelectedVal = newValue);
                }
              },
            ),
          ),
          ListTile(
            title: const Text('DropDownButton with hint:'),
            trailing: DropdownButton<String>(
              items: _dropMenuItems,
              value: _btn2SelectedVal,
              hint: const Text("Choose"),
              onChanged: (String? newValue) {
                setState(() => _btn2SelectedVal = newValue);
              },
            ),
          ),
          ListTile(
            title: const Text('Popup menu button:'),
            trailing: PopupMenuButton<String>(
              onSelected: (String newValue) {
                _btn3SelectedVal = newValue;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_btn3SelectedVal),
                    backgroundColor: Colors.blueGrey,
                  ),
                );
              },
              itemBuilder: (BuildContext context) => _popUpMenuItems,
            ),
          ),
        ],
      ),
    );
  }
}
