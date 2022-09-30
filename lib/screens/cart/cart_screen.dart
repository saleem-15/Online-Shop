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
              'My Cart'.tr,
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
                      'Total price'.tr,
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
                  child: Obx(
                    () => ElevatedButton.icon(
                      onPressed: controller.cartItems.isEmpty ? null : controller.checkout,
                      label: const Icon(Icons.arrow_forward),
                      icon: Text('Checkout'.tr),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(100, 55)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          body: RefreshIndicator(
            onRefresh: controller.onRefresh,
            child: controller.cartItems.isEmpty

                ///empty state
                /// I am using a list if there is no cat items so the user can swipe down
                /// and refreshes  the screen
                ? ListView(
                    itemExtent: 400.h,
                    children: [
                      //Todo put an image when there isn't any items
                      Center(
                        child: controller.isLoading.isTrue
                            ? const CircularProgressIndicator()
                            : Text(
                                'you dont have any cart items',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                      ),
                    ],
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
          ),
        );
      },
    );
  }
}
