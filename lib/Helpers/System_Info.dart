//
// This file contains the code to get the device and app information.
// It uses the device_info_plus and package_info_plus packages to get the device and app information.
// The getDeviceInfo() method gets the device information and the getAppInfo() method gets the app information. 
// June 10, 2024
// Bill Banks office@ourweb.net


import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SystemInfo {
  getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceData = '';
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await  deviceInfo.androidInfo;
        deviceData = 'Android\n';
        deviceData += 'Model: ${androidInfo.model}\n';
        deviceData += 'Android Version: ${androidInfo.version.release}\n';
        deviceData += 'Android SDK: ${androidInfo.version.sdkInt}\n';
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceData = 'iOS\n';
        deviceData += 'Model: ${iosInfo.utsname.machine}\n';
        deviceData += 'Version: ${iosInfo.systemVersion}\n';
      }
    } catch (e) {
      deviceData = 'Failed to get device info';
    }
    deviceData += '\n';
    deviceData += await getAppInfo();
    return deviceData;
  }
  getAppInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appData = '';
    appData += 'App Name: ${packageInfo.appName}\n';
    appData += 'Package Name: ${packageInfo.packageName}\n';
    appData += 'Version: ${packageInfo.version}\n';
    appData += 'Build Number: ${packageInfo.buildNumber}\n';
    return appData;
  }
}