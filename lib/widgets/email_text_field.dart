import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController controller;

  const EmailTextField({Key? key, required this.controller}) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  void onListen() => setState(() {});

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: backgroundColor, fontFamily: "Righteous"),
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: "Seu e-mail aqui",
        hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.8), fontFamily: "Righteous"),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: Colors.white.withOpacity(0.3), width: 5)),
        suffixIcon: widget.controller.text.isEmpty
            ? Container(
                width: 0,
              )
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => widget.controller.clear(),
              ),
      ),
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      validator: (email) => email != null && !EmailValidator.validate(email)
          ? "Entre com um e-mail válido"
          : null,
    );
  }
}
