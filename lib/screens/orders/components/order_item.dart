import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:my_shop/config/theme/light_theme_colors.dart';

enum OrderStatus {
  inDelievery,
  completed,
}

class OrderItemTile extends StatelessWidget {
  const OrderItemTile({
    Key? key,
    required this.size,
    required this.price,
    required this.quantity,
    required this.status,
  }) : super(key: key);

  final String size;
  final double price;
  final int quantity;
  final OrderStatus status;

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
                          Text('Color | Size = $size | Qty = $quantity'),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 5.sp),
                        decoration: BoxDecoration(
                          color: searchTextfieldColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(status.name),
                      ),
                      Text(
                        '\$${price.toStringAsFixed(2)}',
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
    );
  }
}
