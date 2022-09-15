import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/custom_snackbar.dart';

import '../../../app_components/constants/api.dart';

Future<void> logoutService() async {
  try {
    final response = await dio.post(logout);
    log(response.data.toString());
  } on DioError catch (e) {
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Error',
      message: e.response!.data['Messages'].toString(),
    );
  }
}
