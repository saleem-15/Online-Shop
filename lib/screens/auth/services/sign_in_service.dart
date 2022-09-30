import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/utils/helpers.dart';
import 'package:my_shop/storage/my_shared_pref.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';

/// it returnes true if signup process is successful
Future<bool> signInService(String email, String password) async {
  try {
    final response = await dio.post(
      signIn,
      queryParameters: {
        'email': email,
        'password': password,
      },
    );
    //
    final data = response.data['Data'];
    log(data.toString());

    /// store the token in shared pref
    final token = data['access_token'].toString();
    MySharedPref.setUserToken(token);

    return true;
  } on DioError catch (e) {
    log(e.error.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
  }

  return false;
}
