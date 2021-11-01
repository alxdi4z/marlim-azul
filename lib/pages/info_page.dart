import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:marlinazul_frontend/pages/page_custom_view.dart';
import 'package:marlinazul_frontend/pages/page_impl.dart';

import '../functions.dart';

const highlight = false;
const path = "/info";
const showInBar = true;
const title = "Info";

class InfoPage extends PageImpl {
  final Map<String, String>? queryParameters;

  const InfoPage({Key? key, this.queryParameters})
      : super(
            key: key,
            highlight: highlight,
            path: path,
            showInBar: showInBar,
            title: title);

  @override
  State<PageImpl> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic>? _deviceData;
  LocationData? _locationData;

  @override
  Widget build(BuildContext context) =>
      PageCustomView(view: view(context), path: widget.path);

  Future<void> initPlatformState() async {
    var data = <String, dynamic>{};
    try {
      if (kIsWeb) {
        data = readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (Platform.isAndroid) {
          data = readAndroidBuildData(await deviceInfoPlugin.androidInfo);
        } else if (Platform.isIOS) {
          data = readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        } else if (Platform.isLinux) {
          data = readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        } else if (Platform.isMacOS) {
          data = readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
        } else if (Platform.isWindows) {
          data = readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
        }
      }
    } on PlatformException {
      data = <String, dynamic>{"Erro": "Erro ao pegar plataforma"};
    }

    if (!mounted) return;

    setState(() {
      _deviceData = data;
    });
  }

  Future initLocationState() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData data = await location.getLocation();

    if (!mounted) return;

    setState(() {
      _locationData = data;
    });
  }

  Widget view(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        height: 500,
        width: 500,
      ),
    );
  }
}
