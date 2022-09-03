import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../search_controller.dart';

class Results extends GetView<SearchController> {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' ${controller.isLoading.isTrue ? 'Searching' : 'Results'} for "${controller.searchTextController.text}"',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '${controller.numOfResults} found',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                alignment: const Alignment(0, -.5),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // waiting for response from backend
                      if (controller.isLoading.isTrue) LottieBuilder.asset('assets/searching3.json'),

                      // if no results were found
                      if (controller.isLoading.isFalse && controller.numOfResults == 0)
                        LottieBuilder.asset(
                          'assets/no_result_found.json',
                          height: 200.sp,
                        ),
                      if (controller.isLoading.isFalse && controller.numOfResults == 0)
                        Text(
                          'Sorry, The keyword you entered cannot be found, please search with another keyword.',
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                fontSize: 16.sp,
                                height: 1.5,
                              ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
