import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '/config/theme/light_theme_colors.dart';
import 'components/results.dart';
import 'components/suggestions.dart';
import 'search_controller.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = 15.w;
    return WillPopScope(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///search textField
              Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                  right: horizontalPadding,
                  left: horizontalPadding,
                ),
                child: TextFormField(
                  onEditingComplete: controller.search,
                  focusNode: controller.searchFoucus,
                  controller: controller.searchTextController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Search'.tr,
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
                        icon: ImageIcon(
                          const AssetImage('assets/icons/search.png'),
                          color: Theme.of(context).iconTheme.color,
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
                  ///the focus of the textField is removed when the user clicks (search)
                  () => controller.showResults.isTrue ? const Results() : const Suggestions(),
                ),
              ),
            ],
          ),
        ),
      ),
      onWillPop: () {
        return controller.onBackButtonPressed();
      },
    );
  }
}
