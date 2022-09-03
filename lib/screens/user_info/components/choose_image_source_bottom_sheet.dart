import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:my_shop/screens/user_info/user_info_controller.dart';

class ChooseImageSource extends GetView<UserInfoController> {
  const ChooseImageSource({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 7.h,
          ),
          Container(
            width: 60.sp,
            height: 3.sp,
            decoration: BoxDecoration(
              color: const Color(0xffe0e0e0),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Choose image source',
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: controller.pickImageFromCamer,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Camera',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: controller.pickImageFromGallery,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Gallery',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
