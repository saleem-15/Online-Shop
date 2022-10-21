import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/cart_item.dart';
import '../../../shared/item_info.dart';
import '../cart_controller.dart';

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
                          /// product name
                          Text(
                            cartItem.value.productName,
                            style: Theme.of(context).textTheme.headline6,
                          ),

                          /// delete button
                          IconButton(
                            onPressed: () => controller.showDeleteConfirmation(cartItem.value.id),
                            splashRadius: 25,
                            icon: const ImageIcon(AssetImage('assets/icons/delete_icon.png')),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.sp),
                        child: ItemInfo(cartItem: cartItem.value),
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
        // color: lightGrey,
        color: Theme.of(context).colorScheme.primaryContainer,

        borderRadius: BorderRadius.circular(20.r),
      ),
      child: FittedBox(
        child: Row(
          children: [
            Obx(
              () {
                cartItem.value;
                return IconButton(
                  splashRadius: 5,
                  onPressed: cartItem.value.quantity == 1
                      ? null
                      : () => controller.reduceQuantityByOne(cartItem.value.id),
                  icon: ImageIcon(
                    const AssetImage('assets/icons/minus.png'),
                    size: 10.sp,
                  ),
                );
              },
            ),
            Obx(
              () => Text(
                '${cartItem.value.quantity}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            IconButton(
              onPressed: () => controller.increaseQuantityByOne(cartItem.value.id),
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
