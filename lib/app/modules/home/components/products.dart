import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../models/product_preview.dart';
import '../../../modules/home/home_controller.dart';
import '../home_screen.dart';
import 'product_loading.dart';
import 'product_tile.dart';

class Products extends GetView<HomeController> {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pagingController = controller.pagingController;

    return RefreshIndicator(
      color: Theme.of(context).iconTheme.color,
      onRefresh: () => Future.sync(() => pagingController.refresh()),
      child: PagedGridView<int, ProductPreview>(
        padding: EdgeInsets.symmetric(horizontal: HomeScreen.horizontalPadding),
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<ProductPreview>(
          itemBuilder: (context, item, index) => ProductTile(
            product: pagingController.itemList![index],
          ),
          noItemsFoundIndicatorBuilder: (context) => const CircularProgressIndicator(),
          firstPageErrorIndicatorBuilder: (context) {
            return Text(pagingController.error.toString());
          },
          firstPageProgressIndicatorBuilder: (context) => const ProductLoadingSkeleton(),
          newPageErrorIndicatorBuilder: (context) => const Text('coludnt load'),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 10.sp,
          //  height of each tile
          mainAxisExtent: 200.sp,
        ),
      ),
    );

    ///* IN CASE YOU WANT THE PRODUCT TILES  NOT TO HAVE A FIXED SIZE
    //  return MasonryGridView.count(
    //   itemCount: products.length,
    //   crossAxisCount: 2,
    //   mainAxisSpacing: 10.sp,
    //   crossAxisSpacing: 3.w,
    //   itemBuilder: (context, index) {
    //     return ProductTile(
    //       index: index,
    //       products: products,
    //     );
    //   },
    // );
  }
}
