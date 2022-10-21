import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../utils/constants/api.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/helpers.dart';
import '../../../models/shipping_type.dart';

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
