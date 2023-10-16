import 'package:flutter/material.dart';

class HeroAnimationExample extends StatefulWidget {
  const HeroAnimationExample({super.key});

  @override
  State<HeroAnimationExample> createState() => _HeroAnimationExampleState();
}

class _HeroAnimationExampleState extends State<HeroAnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: GestureDetector(
                onTap: () => _showSecondPage(context),
                child: const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("res/images/material_design_3.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSecondPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Scaffold(
              body: Center(
                child: Hero(
                  tag: 'my-hero-animation-tag',
                  child: Image.asset("res/images/material_design_3.png"),
                ),
              ),
            )));
  }
}
