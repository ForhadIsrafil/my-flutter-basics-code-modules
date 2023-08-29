import 'package:flutter/material.dart';

class StackExamples extends StatefulWidget {
  const StackExamples({super.key});

  @override
  State<StackExamples> createState() => _StackExamplesState();
}

class _StackExamplesState extends State<StackExamples> {
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Center(
        child: Stack(
          alignment: _alignmentDirectional,
          children: [
            Container(
              height: 300.0,
              width: 300.0,
              color: Colors.red,
            ),
            Container(width: 200.0, height: 200.0, color: Colors.green),
            Container(width: 100.0, height: 100.0, color: Colors.blue),
          ],
        ),
      ),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getBottomBar() {
    const kAlignmentDirectionalVals = {
      "topStart": AlignmentDirectional.topStart,
      'topCenter': AlignmentDirectional.topCenter,
      'topEnd': AlignmentDirectional.topEnd,
      'centerStart': AlignmentDirectional.centerStart,
      'center': AlignmentDirectional.center,
      'centerEnd': AlignmentDirectional.centerEnd,
      'bottomStart': AlignmentDirectional.bottomStart,
      'bottomCenter': AlignmentDirectional.bottomCenter,
      'bottomEnd': AlignmentDirectional.bottomEnd
    };

    return Material(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text("alignmentDirectional:"),
            trailing: DropdownButton(
              value: _alignmentDirectional,
              items: kAlignmentDirectionalVals
                  .map(
                    (String name, AlignmentDirectional val) => MapEntry(
                      name,
                      DropdownMenuItem(
                        value: val,
                        child: Text(name),
                      ),
                    ),
                  )
                  .values
                  .toList(),
              onChanged: (AlignmentDirectional? Newval) {
                if (Newval != null) {
                  setState(() {
                    _alignmentDirectional = Newval;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
