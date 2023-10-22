import 'package:flutter/material.dart';

class CardInkWellExample extends StatefulWidget {
  const CardInkWellExample({super.key});

  @override
  State<CardInkWellExample> createState() => _CardInkWellExampleState();
}

class _CardInkWellExampleState extends State<CardInkWellExample> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        const Card(
          color: Colors.red,
          elevation: 10.0,
          child: SizedBox(
            height: 100.0,
            child: Row(
              children: [
                Expanded(child: Text("Card 1.")),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.green,
          margin: const EdgeInsets.all(20.0),
          elevation: 0.0,
          child: SizedBox(
            height: 100.0,
            child: InkWell(
              splashColor: Colors.indigo,
              onTap: () {},
              child: const Row(
                children: [
                  Expanded(child: Text("Card 2 (with Inkwell effect on tap.")),
                ],
              ),
            ),
          ),
        ),
        const Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.elliptical(40, 80)),
          ),
          child: SizedBox(
            height: 100.0,
            child: Row(
              children: [
                Expanded(child: Text("Card 3 (with custom border radius)")),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 160.0,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "res/images/material_design_4.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      // right: 16.0,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Card 4 (complex example)',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: const Text("SHARE")),
            TextButton(onPressed: () {}, child: const Text("EXPLORE")),
          ],
        ),
      ],
    );
  }
}
