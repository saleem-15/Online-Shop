import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/theme/light_theme_colors.dart';
import 'components/shipping_address_tile.dart';
import 'shipping_type_controller.dart';

class ShippingTypeScreen extends GetView<ShippingTypeController> {
  const ShippingTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Shipping Type',
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
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: ElevatedButton(
          onPressed: controller.onApplyButtonPressed,
          child: const Text('Apply'),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              ...List.generate(
                controller.shippingTypes.length,
                (index) => ShippingTypeTile(
                  shippingType: controller.shippingTypes[index],
                  myIndex: index,
                ),
              ),
              SizedBox(
                height: 15.h,
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
            ],
          ),
        ),
      ),
    );
  }
}
