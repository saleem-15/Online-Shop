import 'dart:developer';

import 'package:my_shop/app_components/utils/device_info.dart';

String formatErrorMsg(dynamic data) {
  if (data is int) {
    return data.toString();
  }

  if (data is String) {
    return data;
  }

  final errorsMap = data['Messages'];

  if (errorsMap is String) {
    return errorsMap;
  }
  log(data.toString());

  // log('error msg type: ${errorsMap.runtimeType}');
  //the error map is Map<String,List<String>>
  String errorString = '';

  for (var value in errorsMap.values) {
    for (var e in (value as List)) {
      log('value: $e');
      errorString += '$e\n';
    }
  }

  // remove the last (\n)
  errorString = errorString.substring(0, errorString.length - 2);

  return errorString;
}

String getFullImageUrl(String imageUrl) {
  final prefix = DeviceName.deviceName == 'sdk_gphone64_x86_64'
      ? 'http://192.168.56.1:80/laravel9/e-commerce'
      : 'https://578e-37-75-213-177.eu.ngrok.io/laravel9/e-commerce';

  return '$prefix/$imageUrl';
}
