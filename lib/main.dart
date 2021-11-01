import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:marlinazul_frontend/pages/about_page.dart';
import 'package:marlinazul_frontend/pages/info_page.dart';
import 'package:marlinazul_frontend/pages/not_found_page.dart';
import 'package:marlinazul_frontend/pages/page_impl.dart';
import 'package:marlinazul_frontend/pages/signin_page.dart';
import 'package:marlinazul_frontend/pages/take_care.dart';

Future main() async {
  await dot_env.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PageImpl homePage = pageList.firstWhere((page) => page.path == "/");
    return MaterialApp(
      title: 'O Marlin Azul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Righteous"),
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
            pageToGo = InfoPage(queryParameters: uri.queryParameters);
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
