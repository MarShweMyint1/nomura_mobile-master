import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

Future<String> getDeviceOSLevel() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  debugPrint('Running on ${androidInfo.version}');
  return androidInfo.version.sdkInt.toString();
}
