import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_shop/config/theme/my_styles.dart';
import 'package:my_shop/screens/shipping/controllers/shipping_controller.dart';

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
          'Shipping Address'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      bottomNavigationBar: controller.isEditingMode
          ? null
          : Container(
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
                  )
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: ElevatedButton(
                onPressed: controller.onApplyButtonPressed,
                child: Text('Apply'.tr),
              ),
            ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(() => Column(
              children: [
                ...List.generate(
                  controller.shippingAddresses.length,
                  (index) => ShippingAddressTile(
                    address: controller.shippingAddresses[index],
                    myIndex: index,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                // empty state
                Obx(
                  () => controller.shippingAddresses.isEmpty && controller.isLoading.isFalse
                      ? SizedBox(
                          height: 400.h,
                          child:  Center(
                            child: Text('You dont have any addresses'.tr),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                // loading state
                Obx(
                  () => controller.isLoading.isTrue
                      ? SizedBox(
                          height: 400.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: controller.onAddNewAddressPressed,
                    style: MyStyles.getGreyElevatedButtonStyle(),
                    child: Text(
                      'Add New Address'.tr,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
      ),
    );
  }
}
