import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/custom_snackbar.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/utils/helpers.dart';
import '../../../storage/my_shared_pref.dart';

Future<void> editProfileInfoService(
    String name, String nickName, String email, String phone, String dateOfBirth, File? image) async {
  try {
    final response = await dio.put(
      updateUserInfo,
      queryParameters: {
        'name': name,
        //TODO send image parameter Only if the user changed the image
        // 'email': email,
        // 'image': image == null ? null : await MultipartFile.fromFile(image.path),
        'phone': phone,
        'nick_name': nickName,
        'date_of_birth': dateOfBirth
      },
    );
    log(response.data.toString());

    MySharedPref.storeUserData(name, nickName, email, phone, dateOfBirth);

    CustomSnackBar.showCustomSnackBar(
      title: 'Done successfully!',
      message: 'Your info has been updated successfully',
    );
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Error',
      message: formatErrorMsg(e.response!.data['Messages']),
    );
  }
}
