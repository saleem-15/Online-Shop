import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../models/cart_item.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;
  final divider = ' | ';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (cartItem.chosenColor != null)
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color(cartItem.chosenColor!.color),
                radius: 8.r,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text('Color'.tr),
            ],
          ),
        if (cartItem.chosenColor != null && cartItem.chosenSize != null)
          Text(divider),
        if (cartItem.chosenSize != null)
          Text('${'Size'.tr} = ${cartItem.chosenSize!.size}'),
      ],
    );
  }
}
