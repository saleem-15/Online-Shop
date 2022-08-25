import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_shop/config/theme/my_styles.dart';
import 'package:my_shop/screens/shipping/shipping_controller.dart';

import '../../config/theme/light_theme_colors.dart';
import 'components/shipping_address_tile.dart';

class ShippingAddressScreen extends GetView<ShippingController> {
  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Shipping Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            const BoxShadow(),
            BoxShadow(
              color: myBlack.withOpacity(.2),
              blurRadius: 15,
              spreadRadius: 1,
              // blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Apply'),
        ),
      ),
      body: Column(
        children: [
          ...List.generate(
            controller.shippingAddresses.length,
            (index) => ShippingAddressTile(
              isDefaultShippingAddress: index == 0,
              address: controller.shippingAddresses[index],
              myIndex: index,
              selectedIndex: controller.selectedAddressIndex,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ElevatedButton(
            onPressed: controller.addNewAddress,
            style: MyStyles.getGreyElevatedButtonStyle(),
            child: Text(
              'Add New Address',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
