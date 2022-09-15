import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/storage/my_shared_pref.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';

/// it returnes true if signup process is successful
Future<bool> addProductToCartService() async {
  try {
    final response = await dio.post(
      getAllUserCartItems,
      queryParameters: {
        'token': MySharedPref.getToken!,
      },
    );
    //
    final data = response.data['Data'];
    log(data.toString());

    return true;
  } on DioError catch (e) {
    log(e.error.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Error',
      message: e.response!.data['Messages'].toString(),
    );
  }

  return false;
}
