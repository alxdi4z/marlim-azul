import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final Map<String, String> queryParameters;

  const InfoPage({Key? key, required this.queryParameters})
      : super(key: key, path: path, visible: showInBar, title: title);

  @override
  State<PageImpl> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _platformData = {};
  Map<String, dynamic> _locationData = {};
  TextDecoration decoration = TextDecoration.none;
  late bool sentAccess;
  late bool sentLocation;
  late bool sentInfo;

  @override
  void initState() {
    getLocation();
    getPlatform();
    sentAccess = false;
    sentLocation = false;
    sentInfo = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => PageCustomView(
        view: view(context),
        path: widget.path,
        backButton: false,
      );

  Future getPlatform() async {
    var result = <String, dynamic>{};
    try {
      result = readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
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

    if (!sentInfo) {
      Map<String, dynamic> info = {
        "navegador": result["Navegador"],
        "versao": result["Versão"],
        "linguagem": result["Linguagem"],
        "plataforma": result["Plataforma"],
        "useragent": result["UserAgent"]
      };
      saveBrowserInfo(info);
    }

    setState(() {
      _platformData = result;
      sentInfo = true;
    });
  }

  Future getLocation() async {
    Location location = Location();

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

    if (!sentLocation) {
      saveLocation(data.latitude.toString(), data.longitude.toString());
    }

    setState(() {
      _locationData = {
        "Latitude": data.latitude,
        "Longitude": data.longitude,
      };
      sentLocation = true;
    });
  }

  Widget view(BuildContext context) {
    if (!sentAccess) {
      if (widget.queryParameters.containsKey("byemail")) {
        if (widget.queryParameters["byemail"] == "true") {
          saveAccess(false, true);
          setState(() {
            sentAccess = true;
          });
        }
      }
    }
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
                          child: Wrap(
                            children: [
                              RichText(
                                  text: const TextSpan(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Righteous",
                                          fontSize: fontSize),
                                      children: [
                                    TextSpan(
                                        text:
                                            "Para saber mais dê uma olhadinha em "),
                                  ])),
                              InkWell(
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                child: Text(
                                  takeCarePage.title,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: fontSize,
                                      decoration: decoration),
                                ),
                                onHover: (isHovering) {
                                  setState(() {
                                    decoration = isHovering
                                        ? TextDecoration.underline
                                        : TextDecoration.none;
                                  });
                                },
                                onTap: () => Navigator.pushNamed(
                                    context, takeCarePage.path!),
                              ),
                              const Text(
                                ".",
                                style: TextStyle(
                                    color: Colors.white, fontSize: fontSize),
                              )
                            ],
                          )),
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
