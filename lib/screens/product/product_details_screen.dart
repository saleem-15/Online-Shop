// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/models/product.dart';

import 'package:my_shop/screens/product/product_controller.dart';

import '../../app_components/utils/helpers.dart';
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
          icon: Container(
            padding: EdgeInsets.all(6.sp),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.8),
              shape: BoxShape.circle,
            ),
            child: ImageIcon(
              const AssetImage('assets/icons/arrow_back.png'),
              color: product.value.isFavorite ? Colors.red : Theme.of(context).iconTheme.color,
              size: 25.sp,
            ),
            // Icon(
            //   Icons.arrow_back,
            //   color: Theme.of(context).iconTheme.color,
            // ),
          ),
        ),
        actions: [
          Container(
            width: 37.sp,
            height: 37.sp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.8),
              shape: BoxShape.circle,
            ),
            child: Obx(
              () => IconButton(
                onPressed: () => controller.toggleFavorite(),
                color: Colors.green,
                icon:
                    //  Icon(
                    //   product.value.isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                    //   color: product.value.isFavorite ? Colors.red : Theme.of(context).iconTheme.color,
                    //   size: 30.sp,
                    // ),
                    ImageIcon(
                  AssetImage('assets/icons/${product.value.isFavorite ? 'filled_heart' : 'heart'}.png'),
                  color: product.value.isFavorite ? Colors.red : Theme.of(context).iconTheme.color,
                  size: 25.sp,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
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
                  Obx(
                    () => ImageSlideshow(
                      indicatorColor: Theme.of(context).primaryColor,
                      height: 350.h,
                      children: controller.product.value.images
                          .map(
                            (imageURl) => Image.network(
                              //! TODO this is temporary code only for (local host)
                              getFullImageUrl(imageURl),
                              // 'http://192.168.56.1/laravel9/e-commerce/$imageURl',
                              // 'assets/1.jpg',
                              fit: BoxFit.cover,
                            ),
                          )
                          .toList(),
                    ),
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
                child: Column(
                  children: [
                    Divider(
                      height: 30.sp,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total price'.tr,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 12),
                            ),
                            SizedBox(
                              height: 5.sp,
                            ),
                            Obx(
                              () => Text(
                                '\$${controller.totalPrice.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: SizedBox(
                            width: 30.w,
                          ),
                        ),
                        SizedBox(
                          width: 220.w,
                          child: ElevatedButton(
                            onPressed: controller.addToCart,
                            child:  Text('Add to cart'.tr),
                          ),
                        ),
                      ],
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
