import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';

import '../../../models/product_preview.dart';
import '../../home/components/product_tile.dart';
import '../search_controller.dart';

class Results extends GetView<SearchController> {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pagingController = controller.pagingController;
    final horizontalPadding = 20.w;
    return Column(
      children: [
        /// result counter
        Padding(
          padding: EdgeInsets.only(
            right: horizontalPadding,
            left: horizontalPadding,
            bottom: 10,
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: Text(
                    '${controller.isLoadingForFirstPage.isTrue ? 'Searching for'.tr : 'Results for'.tr} "${controller.searchedKeyWord}"',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    '${controller.resultsNum} ${'found'.tr}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: PagedGridView<int, ProductPreview>(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              right: horizontalPadding,
              left: horizontalPadding,
              bottom: 10,
            ),
            showNewPageProgressIndicatorAsGridChild: false,
            showNewPageErrorIndicatorAsGridChild: false,
            showNoMoreItemsIndicatorAsGridChild: false,
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<ProductPreview>(
              itemBuilder: (context, item, index) => ProductTile(
                product: pagingController.itemList![index],
              ),
              noItemsFoundIndicatorBuilder: (context) {
                return Column(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    LottieBuilder.asset(
                      'assets/no_result_found.json',
                      height: 200.sp,
                    ),
                    Text(
                      'no results msg'.tr,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16.sp,
                            height: 1.5,
                          ),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                  ],
                );
              },
              firstPageErrorIndicatorBuilder: (context) =>
                  Text(pagingController.error.toString()),
              firstPageProgressIndicatorBuilder: (context) =>
                  LottieBuilder.asset('assets/searching3.json'),
              newPageErrorIndicatorBuilder: (context) =>
                  const Text('Error, coludnt load'),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 10.sp,
              //  height of each tile
              mainAxisExtent: 200.sp,
            ),
          ),
        ),
      ],
    );
  }
}
//                               if (controller.isLoading.isFalse && controller.numOfResults == 0)
