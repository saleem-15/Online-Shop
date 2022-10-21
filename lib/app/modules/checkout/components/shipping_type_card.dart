import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../models/shipping_type.dart';
import '../checkout_controller.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ShippingTypeCard extends StatelessWidget {
  const ShippingTypeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      assignId: true,
      id: 'selected_shipping_type_listener',
      builder: (controller) {
        final ShippingType? shippingType = controller.shippingType;
        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: InkWell(
            onTap: controller.onShippingTypeCardPressed,
            child: SizedBox(
              height: 70.sp,
              child: Center(
                child: shippingType == null

                    /// choose shipping card
                    ? Padding(
                        padding: EdgeInsets.all(12.sp),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: myBlack,
                              ),
                              child: Icon(
                                Icons.local_shipping_rounded,
                                color: Colors.white,
                                size: 18.sp,
                              ),
                            ),
                            // const Icon(Icons.local_shipping_rounded),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              'Choose Shipping Type'.tr,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      )

                    /// shipping type info card
                    : ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(10.sp),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: myBlack,
                          ),
                          child: Icon(
                            Icons.local_shipping_rounded,
                            color: Colors.white,
                            size: 18.sp,
                          ),
                        ),
                        title: Text(
                          shippingType.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18),
                        ),
                        subtitle: Text(
                            'Estimated Arrival, ${shippingType.estimatedDelivery}'),
                        trailing:
                            Text('\$${shippingType.price.toStringAsFixed(2)}'),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
