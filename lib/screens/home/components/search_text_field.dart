import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/home/home_controller.dart';

class SearchTextField extends GetView<HomeController> {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextFormField(
        onTap: () => Get.toNamed('/search_screen'),
        readOnly: true,
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              splashRadius: 15,
              icon: Image.asset(
                'assets/icons/search.png',
                scale: 1.8,
                fit: BoxFit.scaleDown,
                width: 30.sp,
                height: 30.sp,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
