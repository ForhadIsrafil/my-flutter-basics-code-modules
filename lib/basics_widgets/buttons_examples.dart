import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsExamples extends StatefulWidget {
  const ButtonsExamples({super.key});

  @override
  State<ButtonsExamples> createState() => _ButtonsExamplesState();
}

class _ButtonsExamplesState extends State<ButtonsExamples> {
  @override
  Widget build(BuildContext context) {
    void _showToast() => Fluttertoast.showToast(
          msg: "Button Tapped!",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.tealAccent,
        );
    void _showSnack() => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Button Tapped."),
            duration: Duration(seconds: 1),
          ),
        );

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Column(
            children: [
              // Elevated Button
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _showSnack,
                    child: const Text("ElevatedButton"),
                  ),
                  const ElevatedButton(
                    onPressed: null,
                    child: Text("Disabled-ElevatedButton"),
                  ),
                ],
              ),
              const Divider(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: _showToast,
                    child: const Text("TextButton"),
                  ),
                  const TextButton(
                    onPressed: null,
                    child: Text("Disabled-TextButton"),
                  ),
                ],
              ),
              const Divider(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: _showToast,
                    child: const Text("OutlinedButton"),
                  ),
                  const OutlinedButton(
                    onPressed: null,
                    child: Text("Disabled-OutlinedButton"),
                  ),
                ],
              ),
              const Divider(),
              Column(
                children: [
                  Center(
                    child: IconButton(
                      iconSize: 32.0,
                      icon: const Icon(Icons.call),
                      tooltip: "Place a phone call.",
                      color: Colors.redAccent,
                      splashColor: Colors.blueGrey,
                      hoverColor: Colors.white70,
                      onPressed: _showSnack,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
