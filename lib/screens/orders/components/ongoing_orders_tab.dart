import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../controllers/ongoing_orders_controller.dart';
import 'order_item.dart';

class OngoingOrdersTab extends GetView<OngoingOrdersController> {
  const OngoingOrdersTab({
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
              'No Orders was Found'.tr,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          newPageErrorIndicatorBuilder: (context) => const Text('coludnt load'),
        ),
      ),
    );

    // return Obx(
    //   () => controller.isLoading.isTrue

    //       ///loading state
    //       ? const Center(
    //           child: CircularProgressIndicator(),
    //         )

    //       ///empty state
    //       : controller.onGoingOrders.isEmpty
    //           //TODO put an image
    //           ? const Center(
    //               child: Text('You dont have any onGoing orders'),
    //             )
    //           : ListView.builder(
    //               padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    //               itemCount: controller.onGoingOrders.length,
    //               itemBuilder: (context, index) {
    //                 final order = controller.onGoingOrders[index];
    //                 return OrderItemTile(
    //                   order: order,
    //                 );
    //               },
    //             ),
    // );
  }
}
