import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:marlinazul_frontend/constants.dart';
import 'package:marlinazul_frontend/widgets/page_impl.dart';

bool checkMobile(double width) => width <= 720;

String getRoute(PageImpl page) {
  try {
    return pagesList.firstWhere((p) => p == page).path;
  } catch (e) {
    return "/";
  }
}

Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
  return <String, dynamic>{
    'Release': build.version.release,
    'Codenome': build.version.codename,
    'Sistema Operacional': build.version.baseOS,
    'Bootloader': build.bootloader,
    'Marca': build.brand,
    'Aparelho': build.device,
    'Display': build.display,
    'Hardware': build.hardware,
    'Host': build.host,
    'Patch de segurança': build.version.securityPatch,
    'Id': build.id,
    'Modelo': build.model,
  };
}

Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
  return <String, dynamic>{
    'Nome': data.name,
    'Sistema': data.systemName,
    'Versão do sistema': data.systemVersion,
    'Modelo': data.model,
  };
}

Map<String, dynamic> readLinuxDeviceInfo(LinuxDeviceInfo data) {
  return <String, dynamic>{
    'Versão': data.version,
    'id': data.id,
    'Codenome': data.versionCodename,
    'Nome': data.prettyName,
    'build': data.buildId,
  };
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

Map<String, dynamic> readMacOsDeviceInfo(MacOsDeviceInfo data) {
  return <String, dynamic>{
    'Nome': data.computerName,
    'Host': data.hostName,
    'Modelo': data.model,
    'Versão do Kernel': data.kernelVersion,
    'Release': data.osRelease,
  };
}

Map<String, dynamic> readWindowsDeviceInfo(WindowsDeviceInfo data) {
  return <String, dynamic>{
    'Núcleos': data.numberOfCores,
    'Nome': data.computerName,
  };
}
