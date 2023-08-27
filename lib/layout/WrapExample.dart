import 'package:flutter/material.dart';

class WrapExamples extends StatefulWidget {
  const WrapExamples({super.key});

  @override
  State<WrapExamples> createState() => _WrapExamplesState();
}

class _WrapExamplesState extends State<WrapExamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Wrap(
        // Gap between adjacent chips.
        spacing: 8.0,
        // Gap between lines.
        runSpacing: 4.0,
        children: [
          'Cauchy',
          'Fourrier',
          'Lagrange',
          'Lebesgue',
          'Levy',
          'Poisson',
          'Pointcare',
        ]
            .map(
              (String name) => Chip(
                backgroundColor: Colors.cyan,
                labelStyle: const TextStyle(fontSize: 20),
                // surfaceTintColor: Colors.red,
                label: Text(
                  name,
                ),
                avatar: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  child: Text(
                    name.substring(0, 1),
                    style: const TextStyle(color: Colors.cyan, fontSize: 20),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
