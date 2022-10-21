import 'package:get/get.dart';
import 'package:my_shop/app/modules/search/search_controller.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
