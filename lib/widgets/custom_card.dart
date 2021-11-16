import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

class CustomCard extends StatefulWidget {
  final PageImpl page;
  final double width;
  final bool clickable;

  const CustomCard(
      {Key? key,
      required this.page,
      required this.width,
      required this.clickable})
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
        constraints: const BoxConstraints(minWidth: 100, minHeight: 175),
        child: Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
              border: BorderDirectional(
                  start: BorderSide(
                      color: _borderColor, width: 4, style: BorderStyle.solid)),
              image: widget.page.assetPath != null
                  ? DecorationImage(
                      image: AssetImage(widget.page.assetPath!),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(.86), BlendMode.darken))
                  : null),
          width: widget.width,
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                width: widget.width * .9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          widget.page.title,
                          style: const TextStyle(
                              color: primaryColor,
                              fontSize: fontSize * 1.3,
                              fontFamily: "Righteous"),
                        )),
                    widget.page.subtitle != null
                        ? Text(
                            widget.page.subtitle!,
                            style: TextStyle(
                                color: secondaryColor.withOpacity(0.86),
                                fontSize: fontSize),
                          )
                        : Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        if (widget.clickable) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => widget.page));
        }
      },
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
