import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/custom_snackbar.dart';

import '../../../app_components/constants/api.dart';
import '../../../storage/my_shared_pref.dart';

/// at the first index it returns the id of the user ,
/// ath the second index it returnes if signup process is successful
/// if signup process is Not successful then userId is Null
Future<List> signupService(String name, String nickName, String email, String password, String phone,
    String dateOfBirth, File? image) async {
  String? userId;
  try {
    FormData formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'image': image == null ? null : await MultipartFile.fromFile(image.path),
      'phone': phone,
      'nick_name': nickName,
      'date_of_birth': dateOfBirth
    });

    final response = await dio.post(
      signUp,
      data: formData,
    );
    log(response.data.toString());

    final responseData = response.data['Data'];

    /// store the token in shared pref
    final token = responseData['access_token'].toString();
    MySharedPref.setUserToken(token);

    userId = responseData['id'].toString();

    return [userId, true];
  } on DioError catch (e) {
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Error',
      message: _formatErrorMsg(e.response!.data['Messages']),
    );
  }

  return [userId, false];
}

String _formatErrorMsg(dynamic errorsMap) {
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
