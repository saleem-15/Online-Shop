import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_shop/config/theme/light_theme_colors.dart';
import 'package:my_shop/models/order_item.dart';
import 'package:my_shop/screens/orders/orders_controller.dart';

enum OrderStatus {
  inDelievery,
  completed,
}

class OrderItemTile extends GetView<OrdersController> {
  const OrderItemTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: InkWell(
        onTap: () => controller.trackOrder(order.orderId),
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  'assets/3.jpg',
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
                          'Werlla Cardigans',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.deepPurple[300],
                              radius: 8.r,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text('Color | Size = ${order.chosenSize} | Qty = ${order.quantity}'),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 5.sp),
                          decoration: BoxDecoration(
                            color: searchTextfieldColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(order.status.name),
                        ),
                        Text(
                          '\$${order.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
