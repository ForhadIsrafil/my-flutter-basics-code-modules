import 'package:flutter/material.dart';

class OpacityAnimationExample extends StatefulWidget {
  const OpacityAnimationExample({super.key});

  @override
  State<OpacityAnimationExample> createState() =>
      _OpacityAnimationExampleState();
}

class _OpacityAnimationExampleState extends State<OpacityAnimationExample> {
  double _opacity1 = 1.0, _opacity2 = 1.0, _opacity3 = 1.0;

  Widget _coloredSquare(Color color) {
    return Container(
      width: 100.0,
      height: 100.0,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Click on colored squares below to make them invisible, click '
              'once again to make them reappear.',
            ),
            GestureDetector(
              onTap: () {
                setState(() => _opacity1 = 1.0 - _opacity1);
              },
              child: Opacity(
                opacity: _opacity1,
                child: _coloredSquare(Colors.red),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => _opacity2 = 1.0 - _opacity2);
              },
              child: AnimatedOpacity(
                opacity: _opacity2,
                duration: const Duration(seconds: 1),
                child: _coloredSquare(Colors.green),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() => _opacity3 = 1.0 - _opacity3);
              },
              child: AnimatedOpacity(
                opacity: _opacity3,
                duration: const Duration(seconds: 2),
                child: _coloredSquare(Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
