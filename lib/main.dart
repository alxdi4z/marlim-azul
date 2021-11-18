import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/pages/about_page.dart';
import 'package:marlinazul_frontend/pages/info_page.dart';
import 'package:marlinazul_frontend/pages/not_found_page.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';
import 'package:marlinazul_frontend/pages/signin_page.dart';
import 'package:marlinazul_frontend/pages/take_care.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PageImpl homePage = pagesList.firstWhere((page) => page.path == "/");
    return MaterialApp(
      title: 'O Marlim Azul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Righteous",scrollbarTheme: ScrollbarThemeData(
        isAlwaysShown: true,
        thickness: MaterialStateProperty.all(10),
        thumbColor: MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
        radius: const Radius.circular(10),
        minThumbLength: 30
      )),
      onGenerateRoute: (settings) {
        var uri = Uri.parse(settings.name ?? "/");
        if (uri.toString() == "/") {
          return MaterialPageRoute(builder: (context) => homePage);
        }

        if (uri.pathSegments.isNotEmpty) {
          String route = "/${uri.pathSegments.first}";

          // PageImpl pageToGo = pageList.firstWhere((page) => page.path == route,
          //     orElse: () => pageList.firstWhere((page) => page.path == "/404"));
          PageImpl pageToGo;
          if (route == "/takecare") {
            pageToGo = const TakeCarePage();
          } else if (route == "/info") {
            pageToGo = InfoPage(
              queryParameters: uri.queryParameters,
            );
          } else if (route == "/about") {
            pageToGo = const AboutPage();
          } else if (route == "/signin") {
            pageToGo = SignInPage(
              queryParameters: uri.queryParameters,
            );
          } else {
            pageToGo = const NotFoundPage();
          }

          return MaterialPageRoute(builder: (context) => pageToGo);
        }
      },
      home: homePage,
    );
  }
}
