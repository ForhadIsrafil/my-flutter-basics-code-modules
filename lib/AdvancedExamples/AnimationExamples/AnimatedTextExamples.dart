import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

const _kTexts = ['你好!', 'Hello!', 'Bonjour!', 'Hallo!', 'Grützi!'];
const _kTextStyle = TextStyle(
  fontSize: 32.0,
  fontWeight: FontWeight.bold,
  color: Colors.blueAccent,
);

class AnimatedTextExamples extends StatefulWidget {
  const AnimatedTextExamples({super.key});

  @override
  State<AnimatedTextExamples> createState() => _AnimatedTextExamplesState();
}

class _AnimatedTextExamplesState extends State<AnimatedTextExamples> {
  @override
  Widget build(BuildContext context) {
    final titleTextStyle = Theme.of(context).textTheme.headlineMedium;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Text("TextLiquidFill", style: titleTextStyle),
          TextLiquidFill(
            text: "Forhad Bepary",
            textAlign: TextAlign.center,
            waveColor: Colors.blueAccent,
            boxBackgroundColor: Colors.red[100]!,
            textStyle:
                const TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
            boxHeight: 300.0,
          ),
          const Divider(),
          Text('RotateAnimatedTextKit', style: titleTextStyle),
          SizedBox(
            height: 64.0,
            child: AnimatedTextKit(
              repeatForever: true,
              onTap: () => print("tap event"),
              animatedTexts: [
                for (final txt in _kTexts)
                  RotateAnimatedText(txt,
                      textStyle: _kTextStyle, textAlign: TextAlign.center)
              ],
            ),
          ),
          const Divider(),
          Text('TypewriterAnimatedTextKit', style: titleTextStyle),
          AnimatedTextKit(animatedTexts: [
            for (final txt in _kTexts)
              TypewriterAnimatedText(txt,
                  textStyle: _kTextStyle,
                  textAlign: TextAlign.center,
                  speed: const Duration(milliseconds: 100))
          ]),
          const Divider(),
          Text('FadeAnimatedTextKit', style: titleTextStyle),
          SizedBox(
            height: 64.0,
            child: AnimatedTextKit(
              onTap: () => print("tap event"),
              repeatForever: true,
              animatedTexts: [
                for (final txt in _kTexts)
                  FadeAnimatedText(txt, textStyle: _kTextStyle)
              ],
            ),
          ),
          const Divider(),
          Text('WavyAnimatedTextKit', style: titleTextStyle),
          SizedBox(
            height: 128.0,
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              animatedTexts: [
                for (final txt in _kTexts)
                  WavyAnimatedText(txt,
                      textStyle: _kTextStyle, textAlign: TextAlign.center)
              ],
            ),
          ),
          const Divider(),
          Text('ScaleAnimatedTextKit', style: titleTextStyle),
          SizedBox(
            height: 128.0,
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              animatedTexts: [
                for (final txt in _kTexts)
                  ScaleAnimatedText(txt,
                      textStyle: _kTextStyle, textAlign: TextAlign.center)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
