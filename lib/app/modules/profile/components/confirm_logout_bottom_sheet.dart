import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../auth/controllers/auth_conroller.dart';
import '/config/theme/light_theme_colors.dart';
import '/config/theme/my_styles.dart';

class ConfirmLogoutSheet extends GetView<AuthController> {
  const ConfirmLogoutSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
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
            height: 20.h,
          ),
          Text(
            'Logout'.tr,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: lightRed,
                ),
          ),
          Divider(
            height: 30.h,
          ),
          Text(
            'Are you sure you want to log out?'.tr,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Flexible(
                child: ElevatedButton(
                  style: MyStyles.getGreyElevatedButtonStyle(isLightTheme: !Get.isDarkMode),
                  onPressed: () => Get.back(),
                  child: Text(
                    'Cancel'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: controller.logout,
                  child: Text('Yes, Logout'.tr),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
