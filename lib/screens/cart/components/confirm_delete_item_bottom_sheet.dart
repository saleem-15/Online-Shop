import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/config/theme/my_styles.dart';

import 'package:my_shop/models/cart_item.dart';
import 'package:my_shop/screens/cart/cart_controller.dart';

import '../../checkout/components/checkout_item.dart';

class ConfirmDeleteItem extends GetView<CartController> {
  const ConfirmDeleteItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.h,
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 7.h,
          ),
          Container(
            width: 60.sp,
            height: 3.sp,
            decoration: BoxDecoration(
              color: const Color(0xffe0e0e0),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Remove From Cart?',
            style: Theme.of(context).textTheme.headline5,
          ),
          Divider(
            height: 40.h,
          ),
          CheckoutItem(
            cartItem: cartItem,
          ),
          Divider(
            height: 40.h,
          ),
          Row(
            children: [
              Flexible(
                child: ElevatedButton(
                  style: MyStyles.getGreyElevatedButtonStyle(),
                  onPressed: () => Get.back(),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () {
                    controller.deleteCartItem(cartItem);
                    Get.back();
                  },
                  child: const Text('Yes, Remove'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
