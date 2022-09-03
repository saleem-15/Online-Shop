import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/home/home_controller.dart';

class Categories extends GetView<HomeController> {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoadingCategories.isTrue
          ? const SizedBox.shrink()
          : ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Obx(
                  () {
                    final isSelected = controller.selectedCategoryIndex.value == index;
                    return ChoiceChip(
                      selected: isSelected,
                      onSelected: (value) {
                        controller.selectedCategoryIndex(index);
                      },
                      label: Text(
                        controller.categories[index].name,
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
