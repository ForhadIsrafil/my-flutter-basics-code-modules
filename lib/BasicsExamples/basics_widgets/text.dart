import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xff87b460),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 47, top: 54, right: 222),
            child: const Text(
              "Forhad",
              // textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 9,
                  decoration: TextDecoration.underline,
                  textBaseline: TextBaseline.ideographic),
            ),
          )
        ],
      ),
    );
  }
}
