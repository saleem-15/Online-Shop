// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/models/product.dart';

import 'package:my_shop/screens/product/product_controller.dart';

import 'components/product_info.dart';

class ProductDetailsScreen extends GetView<ProductController> {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Rx<Product> product = controller.product;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: screenHeight,
            maxHeight: double.infinity,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ImageSlideshow(
                    indicatorColor: Theme.of(context).primaryColor,
                    height: 400.h,
                    children: controller.product.value.images
                        .map(
                          (imageURl) => Image.network(
                            imageURl,
                            fit: BoxFit.cover,
                          ),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: 15.w,
                      left: 15.w,
                      top: 17.h,
                    ),
                    child: Obx(
                      () => ProductInfo(product: product.value),
                    ),
                  )
                ],
              ),
              //ADD TO CART BUTTON
              Container(
                padding: EdgeInsets.only(
                  right: 15.w,
                  left: 15.w,
                  top: 17.h,
                  bottom: 20.h,
                ),
                width: 400.w,
                height: 90.sp,
                child: ElevatedButton(
                  onPressed: controller.addToCart,
                  child: const Text('Add to cart'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
