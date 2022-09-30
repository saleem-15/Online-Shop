import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/screens/auth/controllers/auth_conroller.dart';
import 'package:my_shop/screens/auth/screens/signin_screen.dart';
import 'package:my_shop/screens/shipping/controllers/shipping_address_details_controller.dart';
import 'package:my_shop/screens/track_order/shipping_binding.dart';
import 'package:my_shop/screens/track_order/track_order_screen.dart';

import 'app_components/constants/api.dart';
import 'app_components/utils/device_info.dart';
import 'config/theme/my_theme.dart';
import '../screens/cart/cart_controller.dart';
import '../screens/checkout/checkout_screen.dart';
import '../screens/product/product_controller.dart';
import '../screens/product/product_details_screen.dart';
import 'config/translations/localization_service.dart';
import 'app.dart';
import 'screens/checkout/checkout_bindings.dart';
import 'screens/language/language_controller.dart';
import 'screens/language/language_screen.dart';
import 'screens/orders/controllers/ongoing_orders_controller.dart';
import 'screens/shipping/shipping_address_screen.dart';
import 'screens/auth/controllers/signin_controller.dart';
import 'screens/auth/controllers/signup_controller.dart';
import 'screens/checkout/checkout_controller.dart';
import 'screens/home/home_controller.dart';
import 'screens/orders/controllers/completed_orders_controller.dart';
import 'screens/product/product_binding.dart';
import 'screens/profile/profile_controller.dart';
import 'screens/shipping/shipping_binding.dart';
import 'screens/shipping_type/shipping_type_controller.dart';
import 'screens/shipping_type/shipping_type_screen.dart';
import 'screens/track_order/track_order_controller.dart';
import 'screens/user_info/user_info_bindings.dart';
import 'screens/user_info/user_info_controller.dart';
import 'screens/user_info/user_info_screen.dart';
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
  Get.lazyPut(() => CompletedOrdersController(), fenix: true);
  Get.lazyPut(() => OngoingOrdersController(), fenix: true);
  // Get.lazyPut(() => SearchController(), fenix: true);
  Get.lazyPut(() => SigninController(), fenix: true);
  Get.lazyPut(() => SignupController(), fenix: true);
  Get.lazyPut(() => TrackOrderController(), fenix: true);
  Get.lazyPut(() => ProfileController(), fenix: true);
  Get.lazyPut(() => UserInfoController(), fenix: true);
  Get.lazyPut(() => ShippingAddressDetailsController(), fenix: true);
  Get.lazyPut(() => ShippingTypeController(), fenix: true);
  Get.lazyPut(() => LanguageController(), fenix: true);
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // MySharedPref.addSearchSuggestion('g');
    // for (var element in MySharedPref.getRecentSearchs) {
    //   log(element);
    // }

    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Shop',
        translations: LocalizationService(),
        locale: LocalizationService.getCurrnetLanguage,
        getPages: [
          // GetPage(
          //   name: '/search_screen',
          //   page: () => const SearchScreen(),
          // ),
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
          GetPage(
            name: '/shipping_type',
            page: () => const ShippingTypeScreen(),
            // binding: ShippingTypeBindings(),
          ),
          GetPage(
            name: '/language',
            page: () => const LanguageScreen(),
            // binding: ShippingTypeBindings(),
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
            return controller.isUserSignedIn ? const MyApp() : const SigninScreen();
          },
        ),
      ),
    );
  }
}
