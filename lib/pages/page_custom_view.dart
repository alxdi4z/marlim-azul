import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/widgets/custom_drawer.dart';
import 'package:marlinazul_frontend/widgets/logo.dart';
import 'package:marlinazul_frontend/widgets/custom_tab_bar.dart';

import 'home_page.dart';

class PageCustomView extends StatefulWidget {
  final Widget view;
  final String path;

  const PageCustomView({Key? key, required this.view, required this.path})
      : super(key: key);

  @override
  _PageCustomViewState createState() => _PageCustomViewState();
}

class _PageCustomViewState extends State<PageCustomView> {
  late Size screenSize;
  HomePage homePage = const HomePage();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColor,
      endDrawer: customDrawer(widget.path, context),
      key: scaffoldKey,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
              constraints: BoxConstraints(minHeight: screenSize.height),
              child: SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: constraints.maxWidth > 800
                      ? desktopView(screenSize)
                      : mobileView(screenSize)));
        },
      ),
    ));
  }

  Widget mobileView(Size size) {
    return Center(
      child: Column(
        children: [
          mobileBar(size),
          Container(
            color: Colors.transparent,
            height: size.height - mobileBarHeight,
            width: size.width,
            child: widget.view,
          )
        ],
      ),
    );
  }

  Widget desktopView(Size size) {
    return Column(
      children: [
        desktopBar(size),
        Container(
          color: Colors.transparent,
          height: size.height - desktopBarHeight,
          width: size.width,
          child: widget.view,
        )
      ],
    );
  }

  Widget desktopBar(Size size) {
    double fontScaling = size.width > 1000 ? 24 : 19;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: BorderDirectional(
              bottom: BorderSide(
                  color: secondaryColor, width: 5, style: BorderStyle.solid))),
      padding: EdgeInsets.only(
          right: screenSize.width * 0.02, left: screenSize.width * 0.02),
      width: size.width,
      alignment: Alignment.center,
      height: desktopBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              borderRadius: BorderRadius.circular(15),
              hoverColor: primaryColor.withOpacity(0.1),
              highlightColor: primaryColor.withOpacity(0.6),
              onTap: () {
                if (homePage.path != widget.path) {
                  Navigator.pushNamed(context, homePage.path);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SvgPicture.asset("images/marlin_logo.svg",
                          placeholderBuilder: (context) => SizedBox(
                                child: CircularProgressIndicator(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                                height: desktopBarHeight * .6,
                                width: desktopBarHeight * .6,
                              ),
                          height: desktopBarHeight * .6),
                    ),
                    logo(fontScaling * 1.2),
                  ],
                ),
              )),
          const Spacer(),
          CustomTabBar(path: widget.path)
        ],
      ),
    );
  }

  Widget mobileBar(Size size) => Container(
      height: mobileBarHeight,
      width: screenSize.width,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border: BorderDirectional(
              bottom: BorderSide(
                  color: primaryColor, width: 5, style: BorderStyle.solid))),
      child: Padding(
        padding: EdgeInsets.only(
            left: screenSize.width * 0.02, right: screenSize.width * 0.02),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  hoverColor: primaryColor.withOpacity(0.1),
                  highlightColor: primaryColor.withOpacity(0.6),
                  onTap: () {
                    if (homePage.path != widget.path) {
                      Navigator.pushNamed(context, homePage.path);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: SvgPicture.asset("images/marlin_logo.svg",
                              placeholderBuilder: (context) => SizedBox(
                                    child: CircularProgressIndicator(
                                      color: Colors.white.withOpacity(0.3),
                                    ),
                                    height: 19,
                                    width: 19,
                                  ),
                              height: desktopBarHeight * .6),
                        ),
                        logo(19),
                      ],
                    ),
                  )),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.menu_rounded),
              hoverColor: primaryColor.withOpacity(0.1),
              highlightColor: primaryColor.withOpacity(0.6),
              onPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              color: Colors.white,
            )
          ],
        ),
      ));
}
