import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/pages/page_impl.dart';

class CustomTabBar extends StatelessWidget {
  final String path;

  const CustomTabBar({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fontScaling = size.width > 1000 ? 24 : 19;
    const Color fontColor = Colors.white;

    TextStyle styleDefault = TextStyle(
        color: fontColor,
        fontSize: fontScaling,
        fontWeight: FontWeight.bold,
        fontFamily: "Righteous");
    TextStyle styteSelected = TextStyle(
        color: primaryColor,
        fontSize: fontScaling,
        fontWeight: FontWeight.bold,
        fontFamily: "Righteous");

    List<PageImpl> pagesToShow =
        pageList.where((page) => page.showInBar).toList();
    return Row(
        children: pagesToShow.map((page) {
      bool selectedPage = page.path == path;
      return InkWell(
        borderRadius: BorderRadius.circular(15),
        hoverColor: primaryColor.withOpacity(0.1),
        highlightColor: primaryColor.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            page.title,
            style: selectedPage ? styteSelected : styleDefault,
          ),
        ),
        onTap: () {
          if (!selectedPage) {
            Navigator.pushNamed(context, page.path);
          }
        },
      );
    }).toList());
  }
}
