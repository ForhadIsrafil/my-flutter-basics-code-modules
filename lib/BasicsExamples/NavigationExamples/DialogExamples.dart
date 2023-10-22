import 'package:flutter/material.dart';

class DialogsExamples extends StatefulWidget {
  const DialogsExamples({super.key});

  @override
  State<DialogsExamples> createState() => _DialogsExamplesState();
}

class _DialogsExamplesState extends State<DialogsExamples> {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32.0),
      children: <Widget>[
        ////// Alert dialog.
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text("Dialog Title"),
                content: const Text("sample alert"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, "Cancel"),
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, "OK"),
                    child: const Text("OK"),
                  ),
                ],
              ),
            ).then((returnValue) {
              if (returnValue != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("you clicked $returnValue"),
                  action: SnackBarAction(label: "OK", onPressed: () {}),
                ));
              }
            });
          },
          child: const Text("Alert Dialog!"),
        ),
        ////// Simple Dialog.
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                title: const Text('Dialog Title'),
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('user@example.com'),
                    onTap: () => Navigator.pop(context, 'user@example.com'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('user2@gmail.com'),
                    onTap: () => Navigator.pop(context, 'user2@gmail.com'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add_circle),
                    title: const Text('Add account'),
                    onTap: () => Navigator.pop(context, 'Add account'),
                  ),
                ],
              ),
            ).then((returnVal) {
              if (returnVal != null) {
                _messangerKey.currentState?.showSnackBar(
                  SnackBar(
                    content: Text(
                      'You clicked: $returnVal',
                      style: const TextStyle(color: Colors.white),
                    ),
                    action: SnackBarAction(label: 'OK', onPressed: () {}),
                  ),
                );
              }
            });
          },
          child: const Text('Simple dialog'),
        ),
      ]
          .map(
            (Widget button) => Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: button,
            ),
          )
          .toList(),
    );
  }
}
