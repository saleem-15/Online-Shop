import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_shop/config/theme/light_theme_colors.dart';

import '../../../models/shipping_type.dart';
import '../shipping_type_controller.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ShippingTypeTile extends GetView<ShippingTypeController> {
  const ShippingTypeTile({
    Key? key,
    required this.myIndex,
    required this.shippingType,
  }) : super(key: key);

  final int myIndex;
  final ShippingType shippingType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.onShippingTypeTilePressed(myIndex),
      child: Card(
        margin: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 10.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Container(
          height: 70.h,
          padding: EdgeInsets.all(12.sp),
          child: Row(
            children: [
              /// shipping icon
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
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            shippingType.name,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: 10.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      '${'Estimated Arrival'.tr}, ${shippingType.estimatedDelivery}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
              GetBuilder<ShippingTypeController>(
                assignId: true,
                id: 'selected_shipping_type_listener',
                builder: (controller) {
                  return Radio(
                    value: myIndex,
                    groupValue: controller.selectedShippingTypeIndex,
                    onChanged: (value) =>
                        controller.setSelectedShippingTypeIndex(myIndex),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
