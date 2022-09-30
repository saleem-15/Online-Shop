import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_shop/screens/orders/controllers/completed_orders_controller.dart';

import 'order_item.dart';

class CompletedOrdersTab extends GetView<CompletedOrdersController> {
  const CompletedOrdersTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pagingController = controller.pagingController;

    // int => page key , ProductPreview => items of the grid
    return RefreshIndicator(
      onRefresh: () => Future.sync(() => pagingController.refresh()),
      child: PagedListView(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate(
          itemBuilder: (context, item, index) {
            final order = pagingController.itemList![index];

            return OrderItemTile(
              order: order,
            );
          },
          firstPageErrorIndicatorBuilder: (context) => Text(pagingController.error.toString()),
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Text(
              'No Completed Orders was Found'.tr,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          newPageErrorIndicatorBuilder: (context) => const Text('coludnt load'),
        ),
      ),
    );
    // return Padding(
    //   padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    //   child: Obx(
    //     () => controller.isLoading.isTrue
    //         ? const Center(
    //             child: CircularProgressIndicator(),
    //           )
    //         : controller.completedOrders.isEmpty
    //             //TODO put an image
    //             ? const Center(
    //                 child: Text('You dont have any completed orders'),
    //               )
    //             : ListView.builder(
    //                 itemCount: controller.completedOrders.length,
    //                 itemBuilder: (context, index) {
    //                   final order = controller.completedOrders[index];
    //                   return OrderItemTile(
    //                     order: order,
    //                   );
    //                 },
    //               ),
    //   ),
    // );
  }
}
