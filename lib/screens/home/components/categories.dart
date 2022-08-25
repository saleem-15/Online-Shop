import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/home/home_controller.dart';

class Categories extends GetView<HomeController> {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<RxBool> isSelected = controller.isSelected;

    return Wrap(
      children: List.generate(
        controller.categories.length,
        (index) => Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Obx(
            () => ChoiceChip(
              selected: isSelected[index].value,
              onSelected: (value) {
                for (var chip in isSelected) {
                  chip.value = false;
                }
                isSelected[index].value = value;
              },

              // selectedColor: Colors.black,
              label: Text(
                controller.categories[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
