import 'package:flutter/material.dart';

class RowColumnExample extends StatefulWidget {
  const RowColumnExample({super.key});

  @override
  State<RowColumnExample> createState() => _RowColumnExampleState();
}

class _RowColumnExampleState extends State<RowColumnExample> {
  static const kElements = <Widget>[
    Icon(
      Icons.stars,
      size: 50,
    ),
    Icon(
      Icons.stars,
      size: 100,
    ),
    Icon(
      Icons.stars,
      size: 50,
    ),
  ];

  bool _isRow = true;

  MainAxisSize _mainAxisSize = MainAxisSize.max;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    final _appbarButtons = _getBottomBar();
    return Scaffold(
      body: _buidBody(),
      bottomNavigationBar: _appbarButtons,
    );
  }

  Widget _buidBody() => Container(
        color: Colors.indigoAccent,
        child: _isRow
            ? Row(
                mainAxisSize: _mainAxisSize,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                children: kElements,
              )
            : Column(
                mainAxisSize: _mainAxisSize,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                children: kElements,
              ),
      );

  Widget _getBottomBar() {
    return Material(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    value: true,
                    groupValue: _isRow,
                    onChanged: (bool? value) {
                      if (value != null) setState(() => _isRow = value);
                    },
                  ),
                  const Text("Row"),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: false,
                    groupValue: _isRow,
                    onChanged: (bool? value) {
                      if (value != null) setState(() => _isRow = value);
                    },
                  ),
                  const Text('Column'),
                ],
              ),
              Expanded(
                child: ListTile(
                  title: const Text("MainAxisSize"),
                  trailing: DropdownButton(
                    value: _mainAxisSize,
                    onChanged: (MainAxisSize? newValue) {
                      if (newValue != null) {
                        setState(() => _mainAxisSize = newValue);
                      }
                    },
                    items: MainAxisSize.values
                        .map(
                          (MainAxisSize val) => DropdownMenuItem(
                            value: val,
                            child: Text(val
                                .toString()
                                .substring('MainAxisSize.'.length)),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              // Expanded(
              //   child: ListTile(
              //     title: const Text("mainAxisAlignment"),
              //     trailing: DropdownButton(
              //       value: _mainAxisAlignment,
              //       onChanged: (MainAxisAlignment? newVal) {
              //         if (newVal != null) {
              //           setState(() => _mainAxisAlignment = newVal);
              //         }
              //       },
              //       items: MainAxisAlignment.values
              //           .map((MainAxisAlignment value) => DropdownMenuItem(
              //                 value: value,
              //                 child: Text(value
              //                     .toString()
              //                     .substring("MainAxisAlignment.".length)),
              //               ),)
              //           .toList(),
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
