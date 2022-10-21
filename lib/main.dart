import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_shop/app/modules/checkout/checkout_controller.dart';
import 'package:my_shop/app/modules/shipping/controllers/shipping_controller.dart';
import 'package:my_shop/app/modules/user_info/user_info_controller.dart';

import 'app/app_binding.dart';
import 'app/modules/product/product_controller.dart';
import 'app/modules/shipping/controllers/shipping_address_details_controller.dart';
import 'config/theme/my_theme.dart';
import 'config/translations/localization_service.dart';
import 'app/app.dart';
import 'app/modules/auth/controllers/auth_conroller.dart';
import 'app/modules/auth/screens/signin_screen.dart';
import 'app/routes/app_pages.dart';
import 'app/storage/my_shared_pref.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPref.init();
  // apiUrl = DeviceName.deviceName == 'sdk_gphone64_x86_64'
  //     ? 'http://10.0.0.200/laravel9/e-commerce/public/api'
  //     : 'http://10.0.0.200/laravel9/e-commerce/public/api';
  // 'https://a52d-37-75-213-177.eu.ngrok.io/laravel9/e-commerce/public/api';
  Get.lazyPut(() => ProductController(), fenix: true);
  Get.lazyPut(() => UserInfoController(), fenix: true);
  Get.lazyPut(() => ShippingAddressController(), fenix: true);
  Get.lazyPut(() => CheckoutController(), fenix: true);
  Get.lazyPut(() => ShippingAddressDetailsController(), fenix: true);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        title: 'My Shop',
        debugShowCheckedModeBanner: false,
        //
        themeMode: MySharedPref.getThemeMode,
        theme: MyTheme.getThemeData(isLight: true),
        darkTheme: MyTheme.getThemeData(isLight: false),
        //
        translations: LocalizationService(),
        locale: LocalizationService.getCurrnetLanguage,
        //
        initialBinding: AppBindings(),
        getPages: AppPages.routes,
        builder: (context, widget) {
          return MediaQuery(
            // but we want our app font to still the same and dont get affected
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
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
