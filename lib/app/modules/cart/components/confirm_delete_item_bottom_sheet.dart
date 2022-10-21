import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/light_theme_colors.dart';
import '../../../../utils/helpers.dart';
import '../../../models/cart_item.dart';
import '../../../shared/item_info.dart';
import '../cart_controller.dart';
import '/config/theme/my_styles.dart';

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
          CartItemInDeleteConfirmationSheet(
            cartItem: cartItem,
          ),
          Divider(
            height: 40.h,
          ),
          Row(
            children: [
              Flexible(
                child: ElevatedButton(
                  style: MyStyles.getGreyElevatedButtonStyle(isLightTheme: !Get.isDarkMode),
                  onPressed: () => Get.back(),
                  child: Text(
                    'Cancel',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18),
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

class CartItemInDeleteConfirmationSheet extends StatelessWidget {
  const CartItemInDeleteConfirmationSheet({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                getFullImageUrl(cartItem.imageUrl),
                fit: BoxFit.cover,
                width: 100.sp,
                height: 100.sp,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 12.sp),
                child: SizedBox(
                  height: 100.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        cartItem.productName,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      ItemInfo(cartItem: cartItem),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${cartItem.price}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 18),
                          ),
                          CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 13.sp,
                            child: Text(
                              '${cartItem.quantity}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
