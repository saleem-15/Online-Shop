import 'dart:developer';

import 'package:get/get.dart';

import '../../../config/translations/localization_service.dart';
import '../../models/language.dart';
import '../../storage/my_shared_pref.dart';
import 'services/get_all_shiping_types_service.dart';

// ignore_for_file: unnecessary_cast

class LanguageController extends GetxController {
  //
  final List<Language> languages = <Language>[];

  late Rx<Language> selectedLanguage;

  @override
  void onInit() {
    loadShippingTypes();
    final currentLanguageCode = MySharedPref.getCurrentLocal().languageCode;
    log('curent language code: $currentLanguageCode');
    selectedLanguage = languages
        .firstWhere((element) => element.languageCode == currentLanguageCode)
        .obs;
    super.onInit();
  }

  setSelectedShippingTypeIndex(String languageCode) {
    selectedLanguage.value =
        languages.firstWhere((l) => l.languageCode == languageCode);
    LocalizationService.changeLanguage(languageCode);
  }

  void onLanguageTilePressed(String languageCode) {
    log('selected language code: $languageCode');
    setSelectedShippingTypeIndex(languageCode);
  }

  /// loads shipping types from back-end
  void loadShippingTypes() {
    final loadded = getSupportedLanguagesService();
    languages.addAll(loadded);
  }
}
