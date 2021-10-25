import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';

class CustomAlert extends StatelessWidget {
  final double width;
  final String title;
  final String message;
  final bool success;
  const CustomAlert(
      {Key? key,
      required this.width,
      required this.title,
      required this.message,
      required this.success})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = success ? Colors.green : Colors.red;
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: color, style: BorderStyle.solid, width: 4)),
      title: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: color,
              fontSize: fontSize * 1.3,
              fontWeight: FontWeight.bold,
              fontFamily: "Righteous")),
      content: SizedBox(
          width: width,
          height: 100,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    message,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: fontSize,
                        fontFamily: "Righteous"),
                  ),
                )
              ],
            ),
          )),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Ok",
                style: TextStyle(
                  fontSize: fontSize,
                  color: color,
                )))
      ],
    );
  }
}
