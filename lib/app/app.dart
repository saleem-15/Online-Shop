import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'modules/cart/cart_screen.dart';
import 'modules/home/home_screen.dart';
import 'modules/orders/orders_screen.dart';
import 'modules/profile/profile_screen.dart';

/// the variable is outside the screen so the variable doesn't re initialize
final Rx<int> selectedIndex = 0.obs;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Obx(
          () => BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex.value,
            onTap: (index) => selectedIndex.value = index,
            // selectedItemColor: myBlack,
            unselectedItemColor: Colors.grey[400],
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/icons/home.png')),
                label: 'Home'.tr,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/cart.png')),
                label: 'Cart'.tr,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/icons/shoping_bag.png')),
                label: 'Orders'.tr,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'Profile'.tr,
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () {
          selectedIndex.value;
          return Builder(
            builder: (_) {
              // return const ConnectionCheckerDemo();
              switch (selectedIndex.value) {
                case 0:
                  return const HomeScreen();

                case 1:
                  return const CartScreen();

                case 2:
                  return const OrdersScreen();

                case 3:
                  return const ProfileScreen();

                default:
                  return const HomeScreen();
              }
            },
          );
        },
      ),
    );
  }
}
