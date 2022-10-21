import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers.dart';
import '../../../models/product_preview.dart';
import '../home_controller.dart';

class ProductTile extends GetView<HomeController> {
  const ProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductPreview product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),
      child: SizedBox(
        //  height of each tile
        height: 200.sp,
        child: InkWell(
          onTap: () => controller.goToProductDetails(product),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                image: NetworkImage(getFullImageUrl(product.image)),
                placeholder: const AssetImage('assets/image_loading.png'),
                fadeInDuration: const Duration(seconds: 1),
                width: 162.w,
                height: 130.sp,
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
                    Text(
                      product.name,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
