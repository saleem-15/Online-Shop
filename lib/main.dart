import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'config/theme/light_theme_colors.dart';
import 'config/theme/my_theme.dart';
import '../screens/cart/cart_controller.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/checkout/checkout_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/product/product_controller.dart';
import '../screens/product/product_details_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/shipping/shipping_address.dart';
import '../screens/shipping/shipping_binding.dart';
import 'screens/auth/sign_in/signin_controller.dart';
import 'screens/auth/sign_up/signup_controller.dart';
import 'screens/cart/checkout_bindings.dart';
import 'screens/checkout/checkout_controller.dart';
import 'screens/home/home_controller.dart';
import 'screens/orders/orders_controller.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/product/product_binding.dart';
import 'screens/profile/profile_controller.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/search/search_controller.dart';
import 'screens/track_order/track_order_controller.dart';
import 'screens/user_info/user_info_controller.dart';
import 'storage/my_shared_pref.dart';

Future<void> main() async {
  await MySharedPref.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => CheckoutController());
    Get.lazyPut(() => OrdersController());
    Get.lazyPut(() => SearchController(), fenix: true);
    Get.lazyPut(() => SigninController(), fenix: true);
    Get.lazyPut(() => SignupController(), fenix: true);
    Get.lazyPut(() => TrackOrderController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => UserInfoController(), fenix: true);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Rx<int> selectedIndex = 0.obs;

    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        getPages: [
          GetPage(
            name: '/search_screen',
            page: () => const SearchScreen(),
          ),
          GetPage(
            name: '/shipping_addresses',
            page: () => const ShippingAddressScreen(),
            binding: ShippingBinding(),
          ),
          GetPage(
            name: '/checkout',
            page: () => const CheckoutScreen(),
            binding: CheckoutBindings(),
          ),
          GetPage(
            name: '/product_details',
            page: () => const ProductDetailsScreen(),
            binding: ProductBinding(),
          ),
        ],
        builder: (context, widget) {
          bool themeIsLight = MySharedPref.getThemeIsLight();
          return Theme(
            data: MyTheme.getThemeData(isLight: themeIsLight),
            child: MediaQuery(
              // but we want our app font to still the same and dont get affected
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            ),
          );
        },
        home: Obx(
          () => Scaffold(
            // backgroundColor: Colors.green,
            // extendBody: true,
            bottomNavigationBar: Container(
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.h),
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                currentIndex: selectedIndex.value,
                onTap: (index) => selectedIndex.value = index,
                selectedItemColor: myBlack,
                unselectedItemColor: Colors.grey[400],
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/home.png')),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/cart.png')),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/shoping_bag.png')),
                    label: 'Orders',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
            body: Builder(
              builder: (context) {
                // return const SignupScreen();
                // return const ProfileScreen();
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
            ),
          ),
        ),
      ),
    );
  }
}
