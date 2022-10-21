import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';

Future<void> deleteCartItemService(String cartItemId) async {
  try {
    final response = await dio.delete('$CART_PATH/$cartItemId');
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
