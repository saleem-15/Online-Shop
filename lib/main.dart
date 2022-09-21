import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/auth/controllers/auth_conroller.dart';
import 'package:my_shop/screens/auth/screens/signin_screen.dart';
import 'package:my_shop/screens/shipping/controllers/shipping_address_details_controller.dart';
import 'package:my_shop/screens/track_order/shipping_binding.dart';
import 'package:my_shop/screens/track_order/track_order_screen.dart';
import 'package:my_shop/screens/user_info/user_info_screen.dart';

import 'app_components/constants/api.dart';
import 'app_components/utils/device_info.dart';
import 'config/theme/light_theme_colors.dart';
import 'config/theme/my_theme.dart';
import '../screens/cart/cart_controller.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/checkout/checkout_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/product/product_controller.dart';
import '../screens/product/product_details_screen.dart';
import '../screens/search/search_screen.dart';
import 'screens/shipping/shipping_address_screen.dart';
import 'screens/auth/controllers/signin_controller.dart';
import 'screens/auth/controllers/signup_controller.dart';
import 'screens/checkout/checkout_bindings.dart';
import 'screens/checkout/checkout_controller.dart';
import 'screens/home/home_controller.dart';
import 'screens/orders/orders_controller.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/product/product_binding.dart';
import 'screens/profile/profile_controller.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/search/search_controller.dart';
import 'screens/shipping/shipping_binding.dart';
import 'screens/track_order/track_order_controller.dart';
import 'screens/user_info/user_info_bindings.dart';
import 'screens/user_info/user_info_controller.dart';
import 'storage/my_shared_pref.dart';

Future<void> main() async {
  await MySharedPref.init();
  await DeviceName().initDeviceName();
  apiUrl = DeviceName.deviceName == 'sdk_gphone64_x86_64'
      ? 'http://192.168.56.1:80/laravel9/e-commerce/public/api'
      : 'https://a52d-37-75-213-177.eu.ngrok.io/laravel9/e-commerce/public/api';
  initControllers();
  runApp(const MainApp());
}

void initControllers() {
  Get.lazyPut(() => HomeController(), fenix: true);
  Get.put(AuthController(), permanent: true);
  Get.lazyPut(() => ProductController(), fenix: true);
  Get.lazyPut(() => CartController(), fenix: true);
  Get.lazyPut(() => CheckoutController(), fenix: true);
  Get.lazyPut(() => OrdersController(), fenix: true);
  Get.lazyPut(() => SearchController(), fenix: true);
  Get.lazyPut(() => SigninController(), fenix: true);
  Get.lazyPut(() => SignupController(), fenix: true);
  Get.lazyPut(() => TrackOrderController(), fenix: true);
  Get.lazyPut(() => ProfileController(), fenix: true);
  Get.lazyPut(() => UserInfoController(), fenix: true);
  Get.lazyPut(() => ShippingAddressDetailsController(), fenix: true);
  // Get.lazyPut(() => ShippingController(), fenix: true);
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // addProductService();
    log('This is Outside My APP');
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
            binding: ShippingBindings(),
          ),
          GetPage(
            name: '/checkout',
            page: () => const CheckoutScreen(),
            binding: CheckoutBindings(),
          ),
          GetPage(
            name: '/product_details',
            page: () => const ProductDetailsScreen(),
            binding: ProductBindings(),
          ),
          GetPage(
            name: '/track_order',
            page: () => const TrackOrder(),
            binding: TrackOrderBindings(),
          ),
          GetPage(
            name: '/user_info',
            page: () => const UserInfoScreen(),
            binding: UserInfoBindings(),
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
        home: GetBuilder<AuthController>(
          assignId: true,
          id: 'auth_listener',
          builder: (controller) {
            return controller.isUserSignedIn ? MyApp() : const SigninScreen();
          },
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Rx<int> selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      selectedIndex.value;
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
          builder: (_) {
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
      );
    });
  }
}
