import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../models/order_item.dart';
import '../../modules/track_order/track_order_controller.dart';

class OrderCard extends GetView<TrackOrderController> {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderItem order = controller.order;
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
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
                          Text(
                              'Color | Size = ${order.chosenSize} | Qty = ${order.quantity}'),
                        ],
                      ),
                      Text(
                        '\$${order.price.toStringAsFixed(2)}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 18),
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
