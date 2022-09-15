import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/categories.dart';
import 'components/products.dart';
import 'components/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            right: 15.w,
            left: 15.w,
            top: 15.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchTextField(),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Categories',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50.sp,
                child: const Categories(),
              ),
              SizedBox(
                height: 5.h,
              ),
              const Expanded(
                child: Products(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
