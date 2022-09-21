import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/orders/orders_controller.dart';

import 'order_item.dart';

class OngoingOrdersTab extends GetView<OrdersController> {
  const OngoingOrdersTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isTrue

          ///loading state
          ? const Center(
              child: CircularProgressIndicator(),
            )

          ///empty state
          : controller.onGoingOrders.isEmpty
              //TODO put an image
              ? const Center(
                  child: Text('You dont have any onGoing orders'),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  itemCount: controller.onGoingOrders.length,
                  itemBuilder: (context, index) {
                    final order = controller.onGoingOrders[index];
                    return OrderItemTile(
                      order: order,
                    );
                  },
                ),
    );
  }
}
