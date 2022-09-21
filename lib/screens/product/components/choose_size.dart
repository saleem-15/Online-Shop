import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/models/product_size.dart';

import 'package:my_shop/screens/product/product_controller.dart';

import '../../../config/theme/light_theme_colors.dart';

class ChooseSize extends GetView<ProductController> {
  const ChooseSize({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  final List<ProductSize> sizes;

  @override
  Widget build(BuildContext context) {
    final Rx<int> selectedIndex = controller.selectedSizeIndex;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 7.h,
        ),
        Obx(
          () => Wrap(
            children: List.generate(
              sizes.length,
              (index) => SizedBox(
                width: 50.w,
                height: 50.w,
                child: FittedBox(
                  child: ChoiceChip(
                    shape: CircleBorder(
                      side: BorderSide(
                        color: myBlack,
                        width: 1.5.sp,
                      ),
                    ),
                    selected: index == selectedIndex.value,
                    onSelected: (_) => controller.setSelectedSize(index),
                    label: Text(
                      sizes[index].size,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
