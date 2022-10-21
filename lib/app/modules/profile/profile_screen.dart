import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/app/shared/profile_picture.dart';

import '../../modules/profile/profile_controller.dart';
import '/config/theme/light_theme_colors.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile'.tr,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfilePicture(
            image: controller.image == null ? null : FileImage(File(controller.image)),
          ),
          Text(
            controller.name,
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            controller.number,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 10.sp,
          ),
          Divider(
            indent: 15.w,
            endIndent: 15.w,
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  onTap: controller.goToEditProfile,
                  leading: ImageIcon(
                    const AssetImage('assets/icons/profile_icon_64.png'),
                    color: Theme.of(context).iconTheme.color,
                    size: 28.sp,
                  ),
                  title: Text('Edit Profile'.tr),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 20.sp,
                  ),
                ),
                ListTile(
                  onTap: controller.goToShippingAddresses,
                  leading: ImageIcon(
                    const AssetImage('assets/icons/location_icon_64.png'),
                    color: Theme.of(context).iconTheme.color,
                    size: 28.sp,
                  ),
                  title: Text('Address'.tr),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 20.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: ImageIcon(
                    const AssetImage('assets/icons/notification_icon_64.png'),
                    color: Theme.of(context).iconTheme.color,
                    size: 28.sp,
                  ),
                  title: Text('Notification'.tr),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 20.sp,
                  ),
                ),
                ListTile(
                  onTap: controller.goToLanguageScreen,
                  leading: ImageIcon(
                    const AssetImage('assets/icons/language_icon_64.png'),
                    color: Theme.of(context).iconTheme.color,
                    size: 28.sp,
                  ),
                  title: Text('Language'.tr),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 20.sp,
                  ),
                ),
                PopupMenuButton(
                  /// where the menu should appear ******
                  position: PopupMenuPosition.under,
                  offset: const Offset(1, 0),

                  /// where the menu should appear ******
                  onSelected: (themeMode) => controller.setThemeMode(themeMode as ThemeMode),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      value: ThemeMode.light,
                      child: Text('Light Theme'),
                    ),
                    const PopupMenuItem(
                      value: ThemeMode.dark,
                      child: Text('Dark Theme'),
                    ),
                    const PopupMenuItem(
                      value: ThemeMode.system,
                      child: Text('System'),
                    ),
                  ],
                  child: ListTile(
                    leading: ImageIcon(
                      const AssetImage('assets/icons/show_icon_64.png'),
                      color: Theme.of(context).iconTheme.color,
                      size: 28.sp,
                    ),
                    title: Text('Theme'.tr),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Theme.of(context).iconTheme.color,
                      size: 20.sp,
                    ),
                  ),
                ),
                ListTile(
                  onTap: controller.showConfirmLogoutDialog,
                  leading: ImageIcon(
                    const AssetImage('assets/icons/logout_icon_64.png'),
                    color: lightRed,
                    size: 28.sp,
                  ),
                  title: Text('Logout'.tr),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 20.sp,
                  ),
                ),
                // ListTile(onTap: (){},
                //   leading: Icon(Icons.remove_red_eye_rounded),
                //   title: Text('Privacy'),
                //   trailing: Icon(
                //     Icons.arrow_forward_ios_rounded,
                //     color: Theme.of(context).iconTheme.color,
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
