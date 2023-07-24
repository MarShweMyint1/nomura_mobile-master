// Copyright © 2022 Nevis Security AG. All rights reserved.

import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:nevis_mobile_authentication_sdk/nevis_mobile_authentication_sdk.dart';

abstract class CreateDeviceInformationUseCase {
  Future<DeviceInformation> execute();
}

@Injectable(as: CreateDeviceInformationUseCase)
class CreateDeviceInformationUseCaseImpl
    implements CreateDeviceInformationUseCase {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  CreateDeviceInformationUseCaseImpl();

  @override
  Future<DeviceInformation> execute() async {
    final deviceName = await _getDeviceName();

    return Future.value(DeviceInformation(name: deviceName));
  }

  Future<String> _getDeviceName() async {
    String? deviceName;
    String osPrefix = '';
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      osPrefix = 'Android ';
      deviceName = "${androidInfo.manufacturer} ${androidInfo.model}";
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      osPrefix = 'iOS ';
      deviceName = iosInfo.name;
    }
    deviceName = deviceName?.trim();
    deviceName =
        deviceName == null || deviceName.isEmpty ? "Unknown" : deviceName;
    return '$osPrefix$deviceName';
  }
}
