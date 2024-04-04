import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shater/data/model/config_model.dart';
import 'package:shater/data/model/user.dart';

import '../../util/shared_constant.dart';


class SharedPrefs {
  SharedPrefs._();

  static SharedPreferences sharedPreferences = Get.find<SharedPreferences>();

  static Future<void> saveUser(User user) async {
    await sharedPreferences.setString(
        SharedConstant.userKey, jsonEncode(user.toJson()));
  }

  static Future<void> removeUser() async {
    await sharedPreferences.remove(SharedConstant.userKey);
  }

  static User? get user {
    final userStr = sharedPreferences.getString(SharedConstant.userKey);
    if (userStr == null || userStr.isEmpty) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(userStr) as Map<String, dynamic>;
    return User().decode(map);
  }

  static String? get fcmToken {
    final fcmToken = sharedPreferences.getString(SharedConstant.fcmTokenKey);
    if (fcmToken == null || fcmToken.isEmpty) {
      return null;
    }
    return fcmToken;
  }

  static String get storeLogoBase64 =>
      sharedPreferences.getString(SharedConstant.storeLogoBase64) ?? '';

  static Future<void> setConfigs(ConfigModel? configs) async {
    sharedPreferences.setString(SharedConstant.config, jsonEncode(configs));
  }

  static ConfigModel? get configs {
    final config = sharedPreferences.getString(SharedConstant.config);
    if (config != null && config != 'null') {
      Map<String, dynamic> map = jsonDecode(config) as Map<String, dynamic>;
      return ConfigModel().decode(map);
    } else {
      return null;
    }
  }

  static Future<void> setStoreLogoBase64(String value) async {
    await sharedPreferences.setString(SharedConstant.storeLogoBase64, value);
  }
}
