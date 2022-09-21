import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/app_components/utils/helpers.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';

Future<void> deleteCartItemService(String cartItemId) async {
  try {
    final response = await dio.delete('$deleteCartItem/$cartItemId');
    //
    final data = response.data['Data'];
    log(data.toString());
  } on DioError catch (e) {
    log(e.error.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data),
    );
  }
}
