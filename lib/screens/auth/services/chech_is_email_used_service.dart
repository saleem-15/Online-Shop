import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';

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
        message: 'The email is already being used !'.tr,
      );
    }
  } on DioError catch (e) {
    log(e.error.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
  }

  return isEmailUsed;
}
