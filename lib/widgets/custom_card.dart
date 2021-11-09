import 'dart:html';

import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String description;
  final String? logoUrl;
  final double width;
  final double height;
  final Function onClick;

  const CustomCard(
      {Key? key,
      required this.title,
      required this.description,
      this.logoUrl,
      this.subtitle,
      required this.width,
      required this.height,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    return InkWell(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 400),
            child: Container(
              color: Colors.yellow,
              height: height,
              width: width,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: logoUrl != null
                            ? DecorationImage(
                                image: AssetImage(logoUrl!),
                                fit: BoxFit.cover,
                                colorFilter: const ColorFilter.mode(
                                    Colors.black54, BlendMode.darken))
                            : null),
                    padding: const EdgeInsets.all(15),
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: fontSize * 1.3,
                              fontFamily: "Righteous"),
                        ),
                        subtitle != null
                            ? Text(
                                subtitle!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.86),
                                    fontSize: fontSize),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  Container(
                    color: backgroundColor.withOpacity(.8),
                    child: Text(description,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white, fontSize: fontSize)),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
