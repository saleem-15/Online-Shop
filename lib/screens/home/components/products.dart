import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/home/home_controller.dart';

import 'product_loading.dart';
import 'product_tile.dart';

class Products extends GetView<HomeController> {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = controller.productsPreview;

    return Obx(
      () => controller.isLoadingProducts.isTrue
          ? const ProductLoadingSkeleton()
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3.w,
                mainAxisSpacing: 10.sp,
                //  height of each tile
                mainAxisExtent: 270.sp,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => ProductTile(
                index: index,
                products: products,
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
