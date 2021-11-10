import 'dart:html';

import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String description;
  final String? logoUrl;
  final double width;
  final Function onClick;

  const CustomCard(
      {Key? key,
      required this.title,
      required this.description,
      this.logoUrl,
      this.subtitle,
      required this.width,
      required this.onClick})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  Color _borderColor = secondaryColor.withOpacity(0.4);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    return InkWell(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 300),
        child: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
              border: Border.all(
                  color: _borderColor, width: 4, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(25),
              image: widget.logoUrl != null
                  ? DecorationImage(
                      image: AssetImage(widget.logoUrl!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(.86), BlendMode.darken))
                  : null),
          height: 300,
          width: widget.width,
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          color: primaryColor,
                          fontSize: fontSize * 1.3,
                          fontFamily: "Righteous"),
                    ),
                    widget.subtitle != null
                        ? Text(
                            widget.subtitle!,
                            style: TextStyle(
                                color: secondaryColor.withOpacity(0.86),
                                fontSize: fontSize),
                          )
                        : Container()
                  ],
                ),
              ),
              Divider(
                color: Colors.white.withOpacity(0.86),
                height: 20,
              ),
              Container(
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    children: [
                      Text(widget.description,
                          style: const TextStyle(
                              color: Colors.white, fontSize: fontSize))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {},
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (isHovering) {
        setState(() {
          _borderColor =
              isHovering ? primaryColor : secondaryColor.withOpacity(0.4);
        });
      },
      borderRadius: BorderRadius.circular(20),
    );
  }
}
