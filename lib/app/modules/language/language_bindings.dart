import 'package:get/get.dart';
import 'package:my_shop/app/modules/language/language_controller.dart';

class LanguageBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageController());
  }

}