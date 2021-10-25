import 'package:flutter/material.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/pages/page_imp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PageImp homePage = pageList.firstWhere((page) => page.pageInfo.path == "/");
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

          return MaterialPageRoute(
              builder: (context) => pageList.firstWhere(
                  (page) => page.pageInfo.path == route,
                  orElse: () => pageList
                      .firstWhere((page) => page.pageInfo.path == "/404")));
        }
      },
      home: homePage,
    );
  }
}
