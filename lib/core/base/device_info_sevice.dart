import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';


class DeviceInfoService {
  static Future<String> getDeviceType() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceType = 'Unknown';

    try {
      if (Platform.isAndroid) {
        // AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceType = 'android';
      } else if (Platform.isIOS) {
        // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceType = 'iOS';
      }
    } catch (e) {
      print('Error getting device info: $e');
    }

    return deviceType;
  }
}