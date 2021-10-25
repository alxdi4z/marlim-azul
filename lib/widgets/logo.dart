import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';

Widget logo(double size) {
  return RichText(
      text: TextSpan(
          style: TextStyle(fontSize: size, fontFamily: "Righteous"),
          children: const <TextSpan>[
        TextSpan(
            text: "O",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        TextSpan(
          text: "Marlim",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
            text: "Azul",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ))
      ]));
}
