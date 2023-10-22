import 'package:flutter/material.dart';

class ExpandedAndSizedBox extends StatefulWidget {
  const ExpandedAndSizedBox({super.key});

  @override
  State<ExpandedAndSizedBox> createState() => _ExpandedAndSizedBoxState();
}

class _ExpandedAndSizedBoxState extends State<ExpandedAndSizedBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // Expanded() objects takes all available space, and each Expanded gets the
      // portion of space according to it's flex.
      // SizedBox() instead has fixed height/width.
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.cyan,
            child: const Text("Item1: flex=1"),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.green,
            child: const Text("Item2: flex=2"),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.blueGrey,
            child: const Text("Item3: flex=3"),
          ),
        ),
      ],
    );
  }
}
