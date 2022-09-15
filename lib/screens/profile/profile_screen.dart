import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/config/theme/light_theme_colors.dart';
import 'package:my_shop/screens/profile/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 50.sp,
                backgroundImage: AssetImage(controller.image),
              ),
              Positioned(
                bottom: 3.sp,
                right: 3.sp,

                // TODO make the background of the icon white (with photoshop)
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 16.sp,
                      height: 16.sp,
                      color: Colors.white,
                    ),
                    ImageIcon(
                      const AssetImage('assets/edit_square_icon_72.png'),
                      color: Theme.of(context).iconTheme.color,
                      size: 28.sp,
                    ),
                  ],

                  // Icon(
                  //   Icons.edit,
                  //   color: Colors.white,
                  // ),
                ),
              ),
            ],
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
                  onTap:controller.goToEditProfile ,
                  leading: ImageIcon(
                    const AssetImage('assets/icons/profile_icon_64.png'),
                    color: Theme.of(context).iconTheme.color,
                    size: 28.sp,
                  ),
                  title: const Text('Edit Profile'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 20.sp,
                  ),
                ),
                ListTile(
                  onTap:controller.goToShippingAddresses,
                  leading: ImageIcon(
                    const AssetImage('assets/icons/location_icon_64.png'),
                    color: Theme.of(context).iconTheme.color,
                    size: 28.sp,
                  ),
                  title: const Text('Address'),
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
                  title: const Text('Notification'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 20.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: ImageIcon(
                    const AssetImage('assets/icons/language_icon_64.png'),
                    color: Theme.of(context).iconTheme.color,
                    size: 28.sp,
                  ),
                  title: const Text('Language'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 20.sp,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: ImageIcon(
                    const AssetImage('assets/icons/show_icon_64.png'),
                    color: Theme.of(context).iconTheme.color,
                    size: 28.sp,
                  ),
                  title: const Text('Dark Mode'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Theme.of(context).iconTheme.color,
                    size: 20.sp,
                  ),
                ),
                ListTile(
                  onTap: controller.showConfirmLogoutDialog,
                  leading: ImageIcon(
                    const AssetImage('assets/icons/logout_icon_64.png'),
                    color: lightRed,
                    size: 28.sp,
                  ),
                  title: const Text('Logout'),
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
