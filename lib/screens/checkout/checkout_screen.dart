import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/checkout/checkout_controller.dart';

import 'components/checkout_item.dart';
import 'components/price_details_card.dart';
import 'components/shipping_info_card.dart';
import 'components/shipping_type_card.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Checkout'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Shipping Address'.tr,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const ShippingInfoCard(),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Order list'.tr,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ...List.generate(
                controller.cartItems.length,
                (index) {
                  final cartItem = controller.cartItems[index];
                  return CheckoutItem(cartItem: cartItem.value);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Shipping Type'.tr,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const ShippingTypeCard(),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Promo Code'.tr,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Promo Code'.tr,
                ),
              ),
              SizedBox(height: 20.sp),
              const PriceDetailsCard(),
              SizedBox(height: 20.sp),
              ElevatedButton.icon(
                onPressed: controller.onContinueToPaymentButtonPressed,
                label: const Icon(Icons.arrow_forward),
                icon: Text('Continue To Payment'.tr),
              ),
              SizedBox(height: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
