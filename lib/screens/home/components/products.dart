import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: unused_import
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/home/home_controller.dart';
import 'package:my_shop/screens/product/product_controller.dart';

class Products extends GetView<HomeController> {
  const Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = controller.productsPreview;

    // return const ProductLoadingSkeleton();

    return MasonryGridView.count(
      itemCount: products.length,
      crossAxisCount: 2,
      mainAxisSpacing: 5,
      crossAxisSpacing: 0,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 157.w,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                child: InkWell(
                  onTap: () {
                    Get.find<ProductController>().updateProduct(products[index]);

                    Get.toNamed('/product_details');
                  },
                  child: FadeInImage(
                    image: NetworkImage(products[index].image),
                    placeholder: const AssetImage('assets/image_loading.png'),
                    fadeInDuration: const Duration(seconds: 1),
                    width: 150,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            Text(products[index].name),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '\$${products[index].price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        );
        // ignore: dead_code
      },
    );
    // GridView.builder(
    //     gridDelegate:
    //         const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10),
    //     itemCount: 10,
    //     // maxCrossAxisExtent: 220,

    //     // mainAxisSpacing: 10.h,
    //     // crossAxisSpacing: 0,
    //     itemBuilder: (context, index) => Container(
    //           height: index % 3 == 0 ? 100 : 150,
    //           color: index % 3 == 0 ? Colors.red : Colors.green,
    //         )

    // // List.generate(
    //   10,
    //   (index) => ),
    // );
  }
}
