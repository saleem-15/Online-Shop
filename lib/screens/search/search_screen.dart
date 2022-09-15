import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/config/theme/light_theme_colors.dart';
import 'package:my_shop/screens/search/search_controller.dart';

import 'components/results.dart';
import 'components/suggestions.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.isSearched.value = false;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                right: 15.w,
                left: 15.w,
              ),
              child: TextFormField(
                onEditingComplete: controller.search,
                controller: controller.searchTextController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Search',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(13.r),
                    borderSide: const BorderSide(
                      color: myBlack,
                      width: 1.5,
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      splashRadius: 15,
                      icon: Image.asset(
                        'assets/icons/search.png',
                        scale: 1.8,
                        fit: BoxFit.scaleDown,
                        width: 30.sp,
                        height: 30.sp,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.sp,
            ),
            Expanded(
              child: Obx(
                () => controller.isSearched.isTrue ? const Results() : const Suggestions(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
