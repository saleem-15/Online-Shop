import '../../../models/language.dart';

List<Language> getSupportedLanguagesService() {
  return [
    Language(name: 'Arabic', languageCode: 'ar'),
    Language(name: 'English', languageCode: 'en'),
  ];
}
