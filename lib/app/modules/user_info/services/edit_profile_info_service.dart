import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';
import '../../../storage/my_shared_pref.dart';

Future<void> editProfileInfoService(String name, String nickName, String email,
    String phone, String dateOfBirth, File? image) async {
  try {
    final response = await dio.put(
      USER_PATH,
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
      message: 'Your info has been updated successfully'.tr,
    );
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Error',
      message: formatErrorMsg(e.response!.data['Messages']),
    );
  }
}
