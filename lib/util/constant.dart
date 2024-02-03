import '../model/language_model.dart';

class APPCONSTANT {
  static const String COUNTRY_CODE = 'saidBox_country_code';
  static const String LANGUAGE_CODE = 'saidBox_language_code';

  static const List<String> labelTab = [
    "teachers",
    "exercise",
    "subscriptions",
    "top",
    "results",
  ];
  static List<LanguageModel> languages = [
    LanguageModel(
        // imageUrl: IMAGES.english,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        // imageUrl: IMAGES.arabic,
        languageName: 'عربى',
        countryCode: 'SA',
        languageCode: 'ar'),
  ];
}
