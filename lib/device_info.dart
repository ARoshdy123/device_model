import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

final deviceInfoPlugin = DeviceInfoPlugin();

Future<Map<String, String>> getDeviceDetails(BuildContext context) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  Map<String, String> deviceData = <String, String>{};

  try {
    if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo; // check if the device android
      deviceData = {
        'Device Model': androidInfo.model,
        'Operating System Version': androidInfo.version.release
      };
    } else if (Theme.of(context).platform == TargetPlatform.iOS) { // check if the device IOS
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceData = {
        'Device Model': iosInfo.name,
        'Operating System Version': iosInfo.systemVersion
      };
    }
    else if (Theme.of(context).platform == TargetPlatform.windows) { // check if the device Windows
      WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      deviceData = {
        'Device Model': windowsInfo.productName,
        'Operating System Version': windowsInfo.buildLab
      };
    }
    else if (Theme.of(context).platform == TargetPlatform.values) { // check if the device web
      WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
      deviceData = {
        'Device Model': webBrowserInfo.browserName.toString(),
        'Operating System Version': webBrowserInfo.userAgent.toString()
      };
    }
  } catch (e) {
    deviceData = {'Error': 'Failed to get device information'};
  }

  return deviceData; // will return the device model
}



