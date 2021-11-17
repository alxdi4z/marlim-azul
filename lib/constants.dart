import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/pages/about_page.dart';
import 'package:marlinazul_frontend/pages/home_page.dart';
import 'package:marlinazul_frontend/pages/take_care.dart';
import 'package:marlinazul_frontend/pages/not_found_page.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';
import 'package:marlinazul_frontend/pages/signin_page.dart';
import 'package:marlinazul_frontend/pages/info_page.dart';

const secondaryColor = Color.fromRGBO(100, 149, 237, 1);
const primaryColor = Color.fromRGBO(30, 144, 255, 1);
const backgroundColor = Color.fromRGBO(24, 24, 24, 1);
const double fontSize = 20;
const double desktopBarHeight = 90;
const double mobileBarHeight = 60;

List<PageImpl> pagesList = const [
  HomePage(),
  InfoPage(queryParameters: {}),
  TakeCarePage(),
  AboutPage(),
  SignInPage(queryParameters: {},),
  NotFoundPage(),
];
