import 'package:flutter/material.dart';
import 'dart:math' show pi;

class GradientExample extends StatefulWidget {
  const GradientExample({super.key});

  @override
  State<GradientExample> createState() => _GradientExampleState();
}

class _GradientExampleState extends State<GradientExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            height: 200.0,
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.6, 0.9, 1.9],
                colors: [
                  Colors.yellow,
                  Colors.redAccent,
                  Colors.indigo,
                  Colors.teal
                ],
              ),
            ),
            child: const Text(
              "Linear Gradient",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
            ),
          ),
          const Divider(),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                  radius: 0.6,
                  // focalRadius: 0.3,
                  colors: [
                    Colors.redAccent,
                    Colors.indigo,
                    Colors.white70,
                    Colors.teal,
                  ]),
            ),
            child: const Text(
              "Radial Gradient",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
          ),
          const Divider(),
          Container(
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                startAngle: pi / 6,
                endAngle: pi * 1.8,
                colors: [Colors.green, Colors.teal, Colors.deepPurpleAccent],
              ),
            ),
            child: const Text(
              "Sweep Gradient",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
          ),
        ],
      ),
    );
  }
}
