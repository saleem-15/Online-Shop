import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/product_preview.dart';
import '../home_controller.dart';

class ProductTile extends GetView<HomeController> {
  const ProductTile({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);

  final List<ProductPreview> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: InkWell(
        onTap: () => controller.goToProductDetails(products[index]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage(
              fit: BoxFit.cover,

              //!this is the trmporary
              image: NetworkImage('http://192.168.56.1/laravel9/e-commerce/public/${products[index].image}'),
              //!this is the true solution
              // image: NetworkImage(products[index].image),
              placeholder: const AssetImage('assets/image_loading.png'),
              fadeInDuration: const Duration(seconds: 1),
              width: 162.w,
              height: 210.sp,
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 5.sp,
                right: 5.sp,
                bottom: 5.sp,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products[index].name),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '\$${products[index].price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
