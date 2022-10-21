import 'package:get/get.dart';

import '../modules/checkout/checkout_bindings.dart';
import '../modules/checkout/checkout_screen.dart';
import '../modules/language/language_bindings.dart';
import '../modules/language/language_screen.dart';
import '../modules/product/product_binding.dart';
import '../modules/product/product_details_screen.dart';
import '../modules/search/search_binding.dart';
import '../modules/search/search_screen.dart';
import '../modules/shipping/shipping_address_screen.dart';
import '../modules/shipping/shipping_binding.dart';
import '../modules/shipping_type/shipping_type_binding.dart';
import '../modules/shipping_type/shipping_type_screen.dart';
import '../modules/track_order/shipping_binding.dart';
import '../modules/track_order/track_order_screen.dart';
import '../modules/user_info/user_info_bindings.dart';
import '../modules/user_info/user_info_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  // static final routes = [
  //   GetPage(
  //     name: _Paths.HOME,
  //     page: () => HomeView(),
  //     binding: HomeBinding(),
  //   ),
  // ];

  static final routes = [
    GetPage(
      name: '/search_screen',
      page: () => const SearchScreen(),
      binding: SearchBindings(),
    ),
    GetPage(
      name: '/shipping_addresses',
      page: () => const ShippingAddressScreen(),
      binding: ShippingAddressBindings(),
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
      binding: ShippingTypeBindings(),
    ),
    GetPage(
      name: '/language',
      page: () => const LanguageScreen(),
      binding: LanguageBindings(),
    ),
  ];
}
