import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';

Future<bool> checkIsEmailUsedService(
  String email,
) async {
  late bool isEmailUsed;
  try {
    final response = await dio.post(
      checkisEmailUsed,
      queryParameters: {
        'email': email,
      },
    );
    final data = response.data['Data'];

    isEmailUsed = data['taken'].toString() == 'true' ? true : false;
    if (isEmailUsed) {
      CustomSnackBar.showCustomErrorSnackBar(
        title: 'Error',
        message: 'The email is already being used !',
      );
    }
  } on DioError catch (e) {
    log(e.error.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Error',
      message: e.response!.data['Messages'].toString(),
    );
  }

  return isEmailUsed;
}
