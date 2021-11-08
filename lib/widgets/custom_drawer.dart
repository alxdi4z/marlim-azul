import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

Widget customDrawer(String path, BuildContext context) {
  List<PageImpl> pagesToShow =
      pagesList.where((page) => page.visible == true).toList();
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.9),
          border: const BorderDirectional(
              start: BorderSide(color: secondaryColor, width: 5))),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: primaryColor),
                      hoverColor: primaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.white,
                    ),
                  )
                ] +
                pagesToShow.map((page) {
                  bool selectedPage = page.path == path;
                  return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: selectedPage
                                    ? primaryColor
                                    : Colors.transparent,
                                width: 3,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          tileColor: Colors.transparent,
                          selected: selectedPage,
                          hoverColor:
                              selectedPage ? Colors.transparent : primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          title: Text(
                            page.title,
                            style: TextStyle(
                                color:
                                    selectedPage ? primaryColor : Colors.white,
                                fontFamily: "Righteous"),
                          ),
                          onTap: () {
                            if (!selectedPage) {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, page.path);
                            }
                          },
                        ),
                      ));
                }).toList()),
      ),
    ),
  );
}
