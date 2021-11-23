import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

bool checkMobile(double width) => width <= 720;

String getRoute(PageImpl page) {
  String path = "/";
  try {
    PageImpl pageToGo = pagesList.firstWhere((p) => p == page);
    if (pageToGo.path != null) {
      path = pageToGo.path!;
    }
    return path;
  } catch (e) {
    return path;
  }
}

Future saveAccess(bool byMessage, bool byEmail, {String? email}) async {
  if (byEmail == false && byMessage == false) return;
  const String url = "http://marlim-email-sender.herokuapp.com/api/v1/access";
  Map<String, dynamic> body = {
    "email": email,
    "by_email": byEmail,
    "by_message": byMessage
  };
  try {
    Response res = await post(Uri.parse(url),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json; charset=utf-8",
          "Access-Control_Allow_Origin": "*"
        },
        body: json.encode(body));
  } catch (e) {
    print(e.toString());
  }
}

Future saveLocation(String? latitude, String? longitude) async {
  if (longitude == null && latitude == null) return;
  const String url = "http://marlim-email-sender.herokuapp.com/api/v1/location";
  Map<String, dynamic> body = {
    "latitude": latitude,
    "longitude": longitude,
  };
  try {
    Response res = await post(Uri.parse(url),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json; charset=utf-8",
          "Access-Control_Allow_Origin": "*"
        },
        body: json.encode(body));
  } catch (e) {
    print(e.toString());
  }
}

Future saveBrowserInfo(Map<String, dynamic> info) async {
  if (info.isEmpty) return;
  const String url = "http://marlim-email-sender.herokuapp.com/api/v1/browserinfo";
  Map<String, dynamic> body = {
    "navegador": info["navegador"],
    "versao": info["versao"],
    "linguagem": info["linguagem"],
    "plataforma": info["plataforma"],
    "useragent": info["useragent"]
  };
  try {
    Response res = await post(Uri.parse(url),
        headers: {
          "accept": "application/json",
          "Content-Type": "application/json; charset=utf-8",
          "Access-Control_Allow_Origin": "*"
        },
        body: json.encode(body));
  } catch (e) {
    print(e.toString());
  }
}

Map<String, dynamic> readWebBrowserInfo(WebBrowserInfo data) {
  return <String, dynamic>{
    'Navegador': describeEnum(data.browserName),
    'Versão': data.appVersion,
    'Linguagem': data.language,
    'Plataforma': data.platform,
    'UserAgent': data.userAgent,
  };
}