import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  bool _numberInputIsValid = true;

  //  INPUT TEXT FIELD
  Widget _buildNumberTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.headlineMedium,
      decoration: InputDecoration(
        icon: const Icon(Icons.attach_money),
        labelText: "Integer Value",
        hintText: "Enter an integer.",
        errorText: _numberInputIsValid ? null : "Please enter an integer.",
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
      onSubmitted: (val) =>
          Fluttertoast.showToast(msg: "You entered: ${int.parse(val)}"),
      onChanged: (val) {
        final v = int.tryParse(val);
        debugPrint("parsed value: $v");
        if (v == null) {
          setState() => _numberInputIsValid = false;
        } else {
          setState() => _numberInputIsValid = true;
        }
      },
    );
  }

  //  MULTILINE INPUT TEXT FIELD
  final _controller = TextEditingController();

  Widget _buildMultiLineTextField() {
    return TextField(
      controller: _controller,
      maxLines: 10,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          counterText: "${_controller.text.split(" ").length} words.",
          labelText: "Enter Multiline Texts.",
          hintText: "Type something......",
          border: const OutlineInputBorder(),
          helperText: "Max text line is 10."),
      onChanged: (text) => setState(() {}),
    );
  }

  // INPUT/SHOW PASSWORD FIELD
  bool _showPassword = true;

  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: _showPassword,
      decoration: InputDecoration(
        labelText: "password",
        prefixIcon: const Icon(Icons.security),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: _showPassword ? Colors.grey : Colors.blue,
          ),
          onPressed: () => setState(() => _showPassword = !_showPassword),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }

  // Borderless input field
  Widget _buildBorderlessField() {
    return const TextField(
      maxLines: 3,
      decoration: InputDecoration.collapsed(hintText: "Borderless Input Field"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const ListTile(title: Text("1. Number input field.")),
          _buildNumberTextField(),
          const ListTile(title: Text("2. Multiline input field.")),
          _buildMultiLineTextField(),
          const ListTile(title: Text("3. Password input field.")),
          _buildPasswordTextField(),
          const ListTile(title: Text("4. Borderless input.")),
          _buildBorderlessField(),
        ],
      ),
    );
  }
}
