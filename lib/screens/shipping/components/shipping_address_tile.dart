// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/theme/light_theme_colors.dart';
import '../../../models/shipping_address.dart';
import '../shipping_controller.dart';

class ShippingAddressTile extends GetView<ShippingController> {
  const ShippingAddressTile({
    Key? key,
    required this.selectedIndex,
    required this.myIndex,
    required this.address,
    required this.isDefaultShippingAddress,
  }) : super(key: key);

  final Rx<int> selectedIndex;
  final int myIndex;
  final ShippingAddress address;

  final bool isDefaultShippingAddress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.setSelectedAddressIndex(myIndex),
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
              /// location icon
              Container(
                padding: EdgeInsets.all(8.sp),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffe2e2e2),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ImageIcon(
                    const AssetImage('assets/icons/gps.png'),
                    size: 30.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        address.name,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                      ),
                      SizedBox(
                        width: 10.sp,
                      ),
                      if(isDefaultShippingAddress)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 5.sp),
                        decoration: BoxDecoration(
                          color: searchTextfieldColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: const Text('Default'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    address.address,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 13),
                  ),
                ],
              ),
              const Spacer(),
              Obx(
                () => Radio(
                  value: myIndex,
                  groupValue: selectedIndex.value,
                  onChanged: (value) => controller.selectedAddressIndex(myIndex),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
