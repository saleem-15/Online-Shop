import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_shop/models/cart_item.dart';
import 'package:my_shop/screens/cart/cart_controller.dart';

import '../../../config/theme/light_theme_colors.dart';

class CartItemTile extends GetView<CartController> {
  const CartItemTile({Key? key, required this.cartItem}) : super(key: key);

  final Rx<CartItem> cartItem;

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
              borderRadius: BorderRadius.circular(30.r),
              child: Image.network(
                cartItem.value.imageUrl,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Werlla Cardigans',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          IconButton(
                            onPressed: () => controller.showDeleteConfirmation(cartItem.value.productId),
                            splashRadius: 25,
                            icon: const ImageIcon(AssetImage('assets/icons/delete_icon.png')),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.sp),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(cartItem.value.chosenColor!),
                              radius: 8.r,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text('Color | Size = ${cartItem.value.chosenSize}'),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${cartItem.value.totalPrice.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                          ),
                          QuantityChooser(cartItem: cartItem),
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

class QuantityChooser extends GetView<CartController> {
  const QuantityChooser({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final Rx<CartItem> cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: searchTextfieldColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: FittedBox(
        child: Row(
          children: [
            IconButton(
              splashRadius: 5,
              onPressed: () => controller.reduceQuantityByOne(cartItem.value.productId),
              icon: ImageIcon(
                const AssetImage('assets/icons/minus.png'),
                size: 10.sp,
              ),
            ),
            Obx(
              () => Text(
                '${cartItem.value.quantity}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
              onPressed: () => controller.increaseQuantityByOne(cartItem.value.productId),
              splashRadius: 5,
              icon: ImageIcon(
                const AssetImage('assets/icons/plus_.png'),
                size: 22.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
