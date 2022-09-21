import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/models/shipping_type.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';

Future<List<ShippingType>> getAllShippingTypesService() async {
  try {
    final response = await dio.get(getAllShippingTypes);
    final data = response.data['Data'];
    log(data.toString());
    // final dynamic data = [1, 2];

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
  // int count = 0;

  for (var addrs in shippingAddressesData) {
    shippigAddressesList.add(
      ShippingType.fromMap(addrs),
    );
    // shippigAddressesList.add(
    //   ShippingType(
    //     id: '${count++}',
    //     name: '${count++}',
    //     minArrivalTime: 9,
    //     maxArrivalTime: 18,
    //     price: count + 3,
    //   ),
    // );
  }

  return shippigAddressesList;
}
