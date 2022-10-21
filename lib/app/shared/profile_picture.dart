import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required this.image,
  }) : super(key: key);

  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50.sp,
          backgroundImage: image ?? const AssetImage('assets/default_user_image.jpg'),
        ),
        Positioned(
          bottom: 3.sp,
          right: 3.sp,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 15.sp,
                height: 15.sp,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
              ImageIcon(
                const AssetImage('assets/edit_square_icon_72.png'),
                color: Get.isDarkMode ? Colors.white : Colors.black,
                size: 28.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
