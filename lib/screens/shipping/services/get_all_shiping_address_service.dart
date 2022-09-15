import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:my_shop/models/shipping_address.dart';

import '../../../app_components/constants/api.dart';
import '../../../app_components/custom_snackbar.dart';
import '../../../app_components/utils/helpers.dart';

Future<List<ShippingAddress>> getAllShippingAddressService() async {
  try {
    final response = await dio.get(getAllUserShippingAddresses);
    final data = response.data['Data'];
    log(data.toString());

    return converDataToShippingAddress(data as List);
  } on DioError catch (e) {
    log(e.response!.data.toString());
    CustomSnackBar.showCustomErrorSnackBar(
      title: 'Error',
      message: formatErrorMsg(e.response!.data['Messages']),
    );
    return [];
  }
}

List<ShippingAddress> converDataToShippingAddress(List shippingAddressesData) {
  final List<ShippingAddress> shippigAddressesList = [];

  for (var addrs in shippingAddressesData) {
    final id = addrs['id'];
    final addressName = addrs['title'];
    final address = addrs['address'];

    final s = ShippingAddress(id: '$id', name: addressName, address: address);
    shippigAddressesList.add(s);
  }

  return shippigAddressesList;
}
