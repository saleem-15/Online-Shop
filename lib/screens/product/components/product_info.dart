import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_shop/models/product.dart';
import 'package:my_shop/screens/product/components/quantity_chooser.dart';
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
              product.name,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.headline6,
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
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            Text(
              'Quantity',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              width: 30.w,
            ),
            const QuantityChooser(),
          ],
        ),
      ],
    );
  }
}
