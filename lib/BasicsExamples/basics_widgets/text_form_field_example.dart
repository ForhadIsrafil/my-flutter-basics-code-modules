import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({super.key});

  @override
  State<TextFormFieldExample> createState() => _TextFormFieldExampleState();
}

class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  String? _name;
  String? _phoneNumber;
  String? _email;
  String? _password;

  String? _validateName(String? value) {
    if (value?.isEmpty ?? false) {
      return "Name is required.";
    }
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value!)) {
      return "Please enter only alphabetical characters.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0),
            // Name form
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.man),
                hintText: "What do you people call you?",
                labelText: "Name *",
              ),
              onSaved: (String? value) {
                _name = value;
                debugPrint("name=$_name");
              },
              validator: _validateName,
            ),
            const SizedBox(height: 24.0),
            // "Phone Number" form
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                icon: Icon(Icons.phone),
                hintText: "Where can we reach you?",
                labelText: "Phone Number *",
                prefixText: "+088",
              ),
              keyboardType: TextInputType.phone,
              onSaved: (String? value) {
                _phoneNumber = value;
                debugPrint("Phone Number=$_phoneNumber");
              },
              // TextInputFormatters are applied in sequence.
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 24.0),
            // Email form
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                icon: Icon(Icons.email),
                hintText: "Your email address",
                labelText: "E=mail",
              ),
              keyboardType: TextInputType.emailAddress,
              onSaved: (String? value) {
                _email = value;
                debugPrint("Email=$_email");
              },
            ),
            const SizedBox(height: 24.0),
            // "Life story" form.
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tell us about yourself',
                helperText: 'Keep it short.',
                labelText: 'Life story',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 24.0),
            // "Salary" form.
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Salary',
                prefixText: '\$',
                suffixText: 'USD',
                suffixStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24.0),
            // "Password" form.
            PasswordField(
              fieldKey: _passwordFieldKey,
              helperText: 'No more than 8 characters.',
              labelText: 'Password *',
              onFieldSubmitted: (String value) {
                setState(() {
                  _password = value;
                  debugPrint("Password=$_password");
                });
              },
            ),
            const SizedBox(height: 24.0),
            // "Re-type password" form.
            TextFormField(
              enabled: _password != null && _password!.isNotEmpty,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: true,
                labelText: 'Re-type password',
              ),
              maxLength: 8,
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
