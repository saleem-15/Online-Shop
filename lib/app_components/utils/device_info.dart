import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceName {
  static late final String deviceName;

  Future<void> initDeviceName() async => deviceName = await _deviceType();

  Future<String> _deviceType() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    log('device name:${androidInfo.model}');
    return androidInfo.model!;
  }
}
