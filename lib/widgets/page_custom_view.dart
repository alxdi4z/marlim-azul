import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/functions.dart';
import 'package:marlinazul_frontend/pages/take_care.dart';
import 'package:marlinazul_frontend/widgets/custom_drawer.dart';
import 'package:marlinazul_frontend/widgets/logo.dart';
import 'package:marlinazul_frontend/widgets/custom_tab_bar.dart';

import '../pages/home_page.dart';

class PageCustomView extends StatefulWidget {
  final Widget view;
  final String? path;
  final bool backButton;

  const PageCustomView(
      {Key? key, required this.view, this.path, required this.backButton})
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
    bool mobile = checkMobile(screenSize.width);
    return SafeArea(
        child: Scaffold(
      floatingActionButton: widget.backButton
          ? Padding(
              padding: EdgeInsets.only(
                  top: (mobile ? mobileBarHeight : desktopBarHeight) + 25),
              child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, const TakeCarePage().path!);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => backgroundColor),
                      elevation:
                          MaterialStateProperty.resolveWith((states) => 15),
                      side: MaterialStateBorderSide.resolveWith((states) =>
                          const BorderSide(
                              color: primaryColor,
                              style: BorderStyle.solid,
                              width: 4)),
                      shape: MaterialStateProperty.resolveWith(
                          (states) => const CircleBorder())),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: primaryColor,
                    ),
                  )),
            )
          : null,
      floatingActionButtonLocation: mobile
          ? FloatingActionButtonLocation.miniEndFloat
          : FloatingActionButtonLocation.miniStartTop,
      backgroundColor: backgroundColor,
      endDrawer: customDrawer(context, path: widget.path),
      key: scaffoldKey,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              child: constraints.maxWidth > 800
                  ? desktopView(screenSize)
                  : mobileView(screenSize));
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
                if (homePage.path != widget.path && homePage.path != null) {
                  Navigator.pushNamed(context, homePage.path!);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset("images/marlin_logo.png",
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
                    if (homePage.path != widget.path && homePage.path != null) {
                      Navigator.pushNamed(context, homePage.path!);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Image.asset("images/marlin_logo.png",
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
