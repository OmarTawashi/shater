import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../util/constant.dart';
import 'shared_prefrences.dart';

class LocalizationController extends GetxController {
  bool _isLtr = true;
  bool get isLtr => _isLtr;
  Locale get locale => _locale;
  Locale _locale = Locale(APPCONSTANT.languages[1].languageCode!,
      APPCONSTANT.languages[1].countryCode);
  @override
  void onInit() {
    super.onInit();
    loadCurrentLanguage();
    initializeDateFormatting("<locale>", _locale.languageCode);
  }

  void loadCurrentLanguage() {
    _locale = Locale(
        SharedPrefs.sharedPreferences.getString(APPCONSTANT.LANGUAGE_CODE) ??
            APPCONSTANT.languages[1].languageCode!,
        SharedPrefs.sharedPreferences.getString(APPCONSTANT.COUNTRY_CODE) ??
            APPCONSTANT.languages[1].countryCode);
    _isLtr = _locale.languageCode != 'ar';
    for (int index = 0; index < APPCONSTANT.languages.length; index++) {
      if (APPCONSTANT.languages[0].languageCode == _locale.languageCode) {
        break;
      }
    }
    update();
  }

  void setLanguage(Locale locale, {bool fromLoginScreen = false}) {
    // updateFonts(locale.languageCode != 'ar');
    Get.updateLocale(locale);
    saveLanguage(locale);
    _locale = locale;
    if (_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }

    update();
  }

  void saveLanguage(Locale locale) async {
    SharedPrefs.sharedPreferences
        .setString(APPCONSTANT.LANGUAGE_CODE, locale.languageCode);
    SharedPrefs.sharedPreferences
        .setString(APPCONSTANT.COUNTRY_CODE, locale.countryCode ?? '');
  }
}
