import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/product.dart';
import '../product_controller.dart';
import 'choose_color.dart';
import 'choose_size.dart';
import 'quantity_chooser.dart';

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
            Expanded(
              child: Text(
                product.name,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Text(
              '\$${product.price}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        const Divider(),
        Text(
          'Description'.tr,
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
              'Quantity'.tr,
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
