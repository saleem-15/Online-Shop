import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/cart/cart_controller.dart';

import '../../config/theme/light_theme_colors.dart';
import 'components/cart_item.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'My cart',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(20.sp),
            height: 100,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: myBlack.withOpacity(.2),
                  offset: const Offset(0, -40),
                  blurRadius: 30,
                  spreadRadius: 5,
                  // blurStyle: BlurStyle.outer,
                )
              ],
              color: Colors.grey[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total price',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Text(
                      '\$${controller.totalCartItemsPrice.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30.w,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: controller.checkout,
                    label: const Icon(Icons.arrow_forward),
                    icon: const Text('Checkout'),
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(100, 55)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        )),
                  ),
                )
              ],
            ),
          ),
          body: controller.cartItems.isEmpty
              //Todo put an image when there isn't any items
              ? const Center(
                  child: Text('you dont have any cart items'),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = controller.cartItems[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: CartItemTile(cartItem: cartItem),
                    );
                  },
                ),
        );
      },
    );
  }
}
