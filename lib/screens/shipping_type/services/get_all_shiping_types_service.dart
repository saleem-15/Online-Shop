import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/models/shipping_type.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';

Future<List<ShippingType>> getAllShippingTypesService() async {
  try {
    final response = await dio.get(SHIPPIN_TYPE_PATH);
    final data = response.data['Data'];

    return _converDataToShippingTypes(data as List);
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      message: formatErrorMsg(e.response!.data['Messages']),
    );
    return [];
  }
}

List<ShippingType> _converDataToShippingTypes(List shippingAddressesData) {
  final List<ShippingType> shippigAddressesList = [];

  for (var addrs in shippingAddressesData) {
    shippigAddressesList.add(
      ShippingType.fromMap(addrs),
    );
  }

  return shippigAddressesList;
}
