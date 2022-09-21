import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/checkout/checkout_controller.dart';

class PriceDetailsCard extends StatelessWidget {
  const PriceDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.sp,
          vertical: 18.sp,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Amount'),
                GetBuilder<CheckoutController>(
                  assignId: true,
                  id: 'pricing_listener',
                  builder: (controller) {
                    return Text(
                      '\$${controller.ordersTotalPrice.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shipping',
                ),
                GetBuilder<CheckoutController>(
                  assignId: true,
                  id: 'pricing_listener',
                  builder: (controller) {
                    return Text(
                      controller.shippingFee == null
                          ? '-'
                          : '\$${controller.shippingFee!.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 15.sp),
            const Divider(),
            SizedBox(height: 5.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total'),
                GetBuilder<CheckoutController>(
                  assignId: true,
                  id: 'pricing_listener',
                  builder: (controller) {
                    return Text(
                       controller.shippingFee == null
                          ? '-'
                          :
                     '\$${controller.totalFee.toStringAsFixed(2)}' ,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
