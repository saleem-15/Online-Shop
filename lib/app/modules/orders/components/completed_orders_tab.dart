import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../orders/controllers/completed_orders_controller.dart';
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
          firstPageErrorIndicatorBuilder: (context) =>
              Text(pagingController.error.toString()),
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
   
  }
}



