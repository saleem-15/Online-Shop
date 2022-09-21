import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/product/product_controller.dart';

import '../../../models/product_color.dart';

class ChooseColor extends GetView<ProductController> {
  const ChooseColor({
    Key? key,
    required this.colors,
  }) : super(key: key);

  final List<ProductColor> colors;

  @override
  Widget build(BuildContext context) {
    final Rx<int> selectedIndex = controller.selectedColorIndex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Colors',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 7.h,
        ),
        Obx(
          () => Wrap(
            children: List.generate(
              colors.length,
              (index) {
                final bool isSelected = index == selectedIndex.value;
                //
                return SizedBox(
                  width: 50.w,
                  child: FittedBox(
                    child: InputChip(
                      padding: isSelected ? EdgeInsets.only(right: -14.w) : null,
                      checkmarkColor: Colors.white,
                      shape: const CircleBorder(),
                      backgroundColor: Color(colors[index].color),
                      selectedColor: Color(colors[index].color),
                      selected: isSelected,
                      onSelected: (_) => controller.setSelectedColor(index),
                      label: const Text(''),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
