import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocode/geocode.dart';
import 'package:location/location.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/widgets/page_custom_view.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';
import 'package:marlinazul_frontend/pages/take_care.dart';
import 'package:marlinazul_frontend/widgets/row_box.dart';

import '../functions.dart';

const highlight = false;
const path = "/info";
const showInBar = true;
const title = "Infos";

class InfoPage extends PageImpl {
  final Map<String, String>? queryParameters;

  const InfoPage({Key? key, this.queryParameters})
      : super(
            key: key,
            highlight: highlight,
            path: path,
            visible: showInBar,
            title: title);

  @override
  State<PageImpl> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _platformData = {};
  Map<String, dynamic> _locationData = {};

  @override
  void initState() {
    getLocation();
    getPlatform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      PageCustomView(view: view(context), path: widget.path);

  Future getPlatform() async {
    var result = <String, dynamic>{};
    try {
      if (kIsWeb) {
        result = readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          result = readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          result = readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        } else if (Platform.isLinux) {
          result = readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (Platform.isMacOS) {
          result = readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (Platform.isWindows) {
          result = readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
    } on PlatformException {
      result = {
        "Sistema": "Não foi possível determinar informações sobre o sistema"
      };
    }

    if (!mounted) {
      result = {
        "Sistema": "Não foi possível determinar informações sobre o sistema"
      };
    }

    setState(() {
      _platformData = result;
    });
  }

  Future getLocation() async {
    Location location = Location();
    GeoCode geoCode = GeoCode();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        setState(() {
          _locationData = {
            "Localização": "Não foi póssivel determinar a localização"
          };
        });
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        setState(() {
          _locationData = {
            "Localização": "Não foi póssivel determinar a localização"
          };
        });
        return;
      }
    }

    LocationData data = await location.getLocation();

    if (!mounted) {
      setState(() {
        _locationData = {
          "Localização": "Não foi póssivel determinar a localização"
        };
      });
      return;
    }

    Address add = await geoCode.reverseGeocoding(
        latitude: data.latitude!, longitude: data.longitude!);

    setState(() {
      _locationData = {
        "Latitude": data.latitude,
        "Longitude": data.longitude,
        "Cidade": add.city,
        "Endereço": add.streetAddress
      };
    });
  }

  Widget view(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool mobile = checkMobile(size.width);
    PageImpl takeCarePage = const TakeCarePage();

    return Container(
      alignment: Alignment.center,
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            RowBox(
              widgets: [
                SizedBox(
                  width: mobile ? size.width * .9 : size.width * .4,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Righteous",
                                      fontSize: fontSize * 1.6,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(text: "Seus "),
                                    TextSpan(
                                        text: "dados ",
                                        style: TextStyle(color: primaryColor)),
                                    TextSpan(text: "são valiosos!")
                                  ]))),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Righteous",
                                      fontSize: fontSize),
                                  children: [
                                TextSpan(
                                    text:
                                        "Aqui estão algumas informações relacionadas ao seu acesso. "
                                        "Não são dados sensíveis como documentos, por exemplo, mas com os dados certos "
                                        "criminosos podem realizar diversos tipos de crimes, como realizar compras no cartão de crédito ou roubo de identidade."),
                              ]))),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: RichText(
                              text: TextSpan(
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Righteous",
                                      fontSize: fontSize),
                                  children: [
                                const TextSpan(
                                    text:
                                        "Para saber mais dê uma olhadinha em "),
                                TextSpan(
                                    text: takeCarePage.title,
                                    style: const TextStyle(
                                        color: primaryColor,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.wavy),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.pushNamed(
                                          context, takeCarePage.path)),
                                const TextSpan(text: ".")
                              ]))),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    width: mobile ? size.width * .9 : size.width * .45,
                    height: mobile ? size.height * .6 : size.height * .4,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: primaryColor,
                            style: BorderStyle.solid,
                            width: 4),
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView(
                            shrinkWrap: true,
                            children: _platformData.entries
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: RichText(
                                        text: TextSpan(
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Righteous",
                                                fontSize: fontSize),
                                            children: [
                                          TextSpan(
                                              text: e.key.toString() + ": ",
                                              style: const TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(text: e.value.toString()),
                                        ])),
                                  ),
                                )
                                .toList(),
                          ),
                          ListView(
                            shrinkWrap: true,
                            children: _locationData.entries
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: RichText(
                                        text: TextSpan(
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Righteous",
                                                fontSize: fontSize),
                                            children: [
                                          TextSpan(
                                              text: e.key.toString() + ": ",
                                              style: const TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(text: e.value.toString()),
                                        ])),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ),
                    ))
              ],
              width: size.width,
              background: false,
            )
          ],
        ),
      ),
    );
  }
}
