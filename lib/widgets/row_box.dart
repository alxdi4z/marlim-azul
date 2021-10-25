import 'package:flutter/material.dart';

// Widget rowBox(List<Widget> widgets, double width) {

// }

class RowBox extends StatelessWidget {
  final List<Widget> widgets;
  final double width;
  final double? height;
  final bool? background;
  const RowBox(
      {Key? key,
      required this.widgets,
      required this.width,
      this.height,
      this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool mobile = width <= 800;
    return ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: height ?? MediaQuery.of(context).size.height * .2,
            minWidth: width),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: background == null || background == true
                    ? Colors.white.withOpacity(0.04)
                    : Colors.transparent,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            padding: const EdgeInsets.all(40),
            child: SizedBox(
              width: width,
              child: Wrap(
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment:
                    mobile ? WrapAlignment.center : WrapAlignment.spaceBetween,
                children: widgets,
              ),
            ),
          ),
        ));
  }
}
