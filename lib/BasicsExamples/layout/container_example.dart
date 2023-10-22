import 'package:flutter/material.dart';

class ContainerExample extends StatefulWidget {
  const ContainerExample({super.key});

  @override
  State<ContainerExample> createState() => _ContainerExampleState();
}

class _ContainerExampleState extends State<ContainerExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300.0,
        width: 300.0,
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 5, color: Colors.tealAccent),
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(20.0)),
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 30.0, 40.0),
            child: Container(
              color: Colors.red,
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              transform: Matrix4.rotationZ(-0.2),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10.0),
                    right: Radius.circular(80.0),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text("Container",style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
