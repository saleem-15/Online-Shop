import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'components/categories.dart';
import 'components/products.dart';
import 'components/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final horizontalPadding = 15.w;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: horizontalPadding,
                left: horizontalPadding,
                top: 15.h,
              ),
              child: const SearchTextField(),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Categories'.tr,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50.sp,
                child: const Categories(),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            const Expanded(
              child: Products(),
            ),
          ],
        ),
      ),
    );
  }
}
