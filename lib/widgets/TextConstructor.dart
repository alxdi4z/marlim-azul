import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';

class TextConstructor {
  static Widget MainTitle(String text, Color color, EdgeInsetsGeometry padding) => Padding(
        padding: padding,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: fontSize * 1.7),
          ),
        ),
      );

  static Widget Subtitle(List<TextSpan> listText, Color color, EdgeInsetsGeometry padding) => Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 3.5,
            backgroundColor: color,
          ),
          const SizedBox(width: 5,),
          RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                  style: TextStyle(
                      color: color, fontSize: fontSize * 1.2, height: 1.5),
                  children: listText))
        ],
      ));

  static Widget Paragraph(List<TextSpan> listText, Color color, EdgeInsetsGeometry padding) => Padding(
      padding: padding,
      child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
              style: TextStyle(color: color, fontSize: fontSize, height: 1.5),
              children: listText)));
}
