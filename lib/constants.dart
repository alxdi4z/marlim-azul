import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/pages/about_page.dart';
import 'package:marlinazul_frontend/pages/home_page.dart';
import 'package:marlinazul_frontend/pages/take_care.dart';
import 'package:marlinazul_frontend/pages/not_found_page.dart';
import 'package:marlinazul_frontend/pages/page_imp.dart';
import 'package:marlinazul_frontend/pages/page_info.dart';
import 'package:marlinazul_frontend/pages/signin_page.dart';
import 'package:marlinazul_frontend/pages/info_page.dart';

const secondaryColor = Color.fromRGBO(100, 149, 237, 1);
const primaryColor = Color.fromRGBO(30, 144, 255, 1);
const backgroundColor = Color.fromRGBO(24, 24, 24, 1);
const double fontSize = 20;
const double desktopBarHeight = 90;
const double mobileBarHeight = 60;

List<PageImp> pageList = const [
  PageImp(
      pageInfo: PageInfo(
          title: "Home",
          path: "/",
          page: HomePage(),
          showInBar: false,
          highlight: false)),
  PageImp(
      pageInfo: PageInfo(
          title: "Cuide-se",
          path: "/takecare",
          page: TakeCarePage(),
          showInBar: true,
          highlight: false)),
  PageImp(
      pageInfo: PageInfo(
          title: "Info",
          path: "/info",
          page: InfoPage(),
          showInBar: true,
          highlight: false)),
  PageImp(
      pageInfo: PageInfo(
          title: "Sobre",
          path: "/about",
          page: AboutPage(),
          showInBar: true,
          highlight: false)),
  PageImp(
      pageInfo: PageInfo(
          title: "Inscreva-se",
          path: "/signin",
          page: SignInPage(),
          showInBar: true,
          highlight: true)),
  PageImp(
      pageInfo: PageInfo(
          title: "404",
          path: "/404",
          page: NotFoundPage(),
          showInBar: false,
          highlight: false)),
];

String getRoute(Widget page) {
  try {
    return pageList.firstWhere((p) => p.pageInfo.page == page).pageInfo.path;
  } catch (e) {
    return "/";
  }
}
