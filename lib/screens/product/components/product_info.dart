import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_shop/models/product.dart';
import 'package:my_shop/screens/product/product_controller.dart';

import 'choose_color.dart';
import 'choose_size.dart';

class ProductInfo extends GetView<ProductController> {
  const ProductInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: double.infinity),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Venesa Long Shirt',
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
              onPressed: () => controller.toggleFavorite(),
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: product.isFavorite ? Colors.red : Theme.of(context).iconTheme.color,
                size: 30.sp,
              ),
            ),
          ],
        ),
        const Divider(),
        Text(
          'Description',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          product.description,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          '\$${product.price}',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 20.h,
        ),
        if (product.sizes.isNotEmpty)
          ChooseSize(
            sizes: product.sizes,
          ),
        SizedBox(
          height: 15.h,
        ),
        if (product.colors.isNotEmpty)
          ChooseColor(
            colors: product.colors,
          ),
      ],
    );
  }
}
