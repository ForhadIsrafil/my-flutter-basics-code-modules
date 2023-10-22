import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  final _rng = Random();
  double _height = 100;
  double _width = 100;
  double _borderRadius = 8;
  Color _color = Colors.teal;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              // Generate a random width and height.
              _width = _rng.nextInt(100).toDouble() + 50;
              _height = _rng.nextInt(100).toDouble() + 50;
              _borderRadius = _rng.nextInt(50).toDouble() + 50;

              // Generate a random color.
              _color = Color.fromRGBO(
                  _rng.nextInt(256), _rng.nextInt(256), _rng.nextInt(256), 1);
            }),
            child: AnimatedContainer(
              margin: const EdgeInsets.all(8),
              duration: const Duration(seconds: 1),
              // Use the properties stored in the State class.
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
              curve: Curves.easeIn,
              child: const FlutterLogo(),
            ),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.update),
            label: const Text('Change random property'),
            onPressed: () => setState(() {
              // Generate a random width and height.
              _width = _rng.nextInt(100).toDouble() + 50;
              _height = _rng.nextInt(100).toDouble() + 50;
              _borderRadius = _rng.nextInt(50).toDouble() + 50;

              // Generate a random color.
              _color = Color.fromRGBO(
                  _rng.nextInt(256), _rng.nextInt(256), _rng.nextInt(256), 1);
            }),
          )
        ],
      ),
    );
  }
}
