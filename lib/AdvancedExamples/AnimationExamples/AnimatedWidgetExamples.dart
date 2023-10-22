import 'package:flutter/material.dart';

// The AnimatedWidget base class allows you to separate out the core widget code
// from the animation code.
class _AnimatedLogo extends AnimatedWidget {
  const _AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    print(animation);

    return Center(
      child: Container(
        color: Colors.yellow,
        margin: const EdgeInsets.all(8.0),
        width: animation.value,
        height: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}

class AnimatedWidgetExamples extends StatefulWidget {
  const AnimatedWidgetExamples({super.key});

  @override
  State<AnimatedWidgetExamples> createState() => _AnimatedWidgetExamplesState();
}

class _AnimatedWidgetExamplesState extends State<AnimatedWidgetExamples>
    with SingleTickerProviderStateMixin {
  late Animation<double> _sizeAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _sizeAnimation = Tween<double>(begin: 50, end: 100).animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AnimatedLogo(
          animation: _sizeAnimation,
        ),
        ElevatedButton(onPressed: ()=> controller.forward(), child: const Text("Forward")),
        ElevatedButton(onPressed: ()=> controller.reverse(), child: const Text("Reverse")),
      ],
    );
  }
}
