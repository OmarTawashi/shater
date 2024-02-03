import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shater/controller/localization_controller.dart';

import '../model/language_model.dart';
import '../util/constant.dart';

class InitApp {
  static initLanguage() async {
    Get.lazyPut(() => LocalizationController());

    Map<String, Map<String, String>> _languages = Map();
    for (LanguageModel languageModel in APPCONSTANT.languages) {
      String jsonStringValues = await rootBundle
          .loadString('assets/language/${languageModel.languageCode}.json');
      Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
      Map<String, String> _json = Map();
      _mappedJson.forEach((key, value) {
        _json[key] = value.toString();
      });
      _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
          _json;
    }
    return _languages;
  }
}
