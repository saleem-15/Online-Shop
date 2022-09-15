import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/utils/helpers.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';

/// it returnes true if signup process is successful
Future<bool> getAllCartItemsService() async {
  try {
    final response = await dio.get(getAllUserCartItems);
    //
    final data = response.data['Data'];
    log(data.toString());

    return true;
  } on DioError catch (e) {
    log(e.error.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
  }

  return false;
}
