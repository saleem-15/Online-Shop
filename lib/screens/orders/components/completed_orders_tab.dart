import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/orders/orders_controller.dart';

import 'order_item.dart';

class CompletedOrdersTab extends GetView<OrdersController> {
  const CompletedOrdersTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: controller.completedOrders.isEmpty
          //TODO put an image
          ? const Center(
              child: Text('You dont have any completed orders'),
            )
          : ListView.builder(
              itemCount: controller.completedOrders.length,
              itemBuilder: (context, index) {
                final order = controller.completedOrders[index];
                return OrderItemTile(
                  order: order,
                );
              },
            ),
    );
  }
}
