import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/product/product_controller.dart';

import '../../../config/theme/light_theme_colors.dart';

class QuantityChooser extends GetView<ProductController> {
  const QuantityChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: searchTextfieldColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
            splashRadius: 5,
            onPressed: () => controller.reduceQuantityByOne(),
            icon: ImageIcon(
              const AssetImage('assets/icons/minus.png'),
              size: 10.sp,
            ),
          ),
          Obx(
            () => Text(
              '${controller.quantity.value}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          IconButton(
            onPressed: () => controller.increaseQuantityByOne(),
            splashRadius: 5,
            icon: ImageIcon(
              const AssetImage('assets/icons/plus_.png'),
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
