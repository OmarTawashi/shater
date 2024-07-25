import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shater/data/model/config_model.dart';
import 'package:shater/data/model/user.dart';

import '../../data/model/data_register_model.dart';
import '../../util/shared_constant.dart';

class SharedPrefs {
  SharedPrefs._();

  static SharedPreferences sharedPreferences = Get.find<SharedPreferences>();

  static Future<void> saveUser(User user , String a) async {
    log("============================================= saveUser =============================================");
    log("from : $a");
    log("user.toJson() : ${user.toJson()}");
    log("============================================= saveUser =============================================");
    await sharedPreferences.setString(
        SharedConstant.userKey, jsonEncode(user.toJson()));
  }

  static Future<void> saveSelectedChild(ChildUser child) async {
    log("child id : ${child.id}");
    await sharedPreferences.setString(
        SharedConstant.selectedChildKey, jsonEncode(child.toJson()));
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

  // static ChildUser? get child {
  //   final userStr = sharedPreferences.getString(SharedConstant.childKey);
  //   if (userStr == null || userStr.isEmpty) {
  //     return null;
  //   }
  //   Map<String, dynamic> map = jsonDecode(userStr) as Map<String, dynamic>;
  //   return ChildUser().decode(map);
  // }

  static ChildUser? get selectedChild {
    final userStr = sharedPreferences.getString(SharedConstant.selectedChildKey);
    if (userStr == null || userStr.isEmpty) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(userStr) as Map<String, dynamic>;
    return ChildUser().decode(map);
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

  static Future<void> saveDataForUserRegistration(
      DataRegisterModel data) async {
    await sharedPreferences.setString(
        SharedConstant.dataForUserRegistrationKey, jsonEncode(data.toJson()));
  }

  static DataRegisterModel? get dataRegister {
    final str =
        sharedPreferences.getString(SharedConstant.dataForUserRegistrationKey);
    if (str == null || str.isEmpty) {
      return null;
    }
    Map<String, dynamic> map = jsonDecode(str) as Map<String, dynamic>;
    return DataRegisterModel().decode(map);
  }

  static String getToken(int type) {
    // type 0 = parent token || 1 = child token
    if(type == 1){
      return selectedChild?.apiToken ?? '';
    }else{
      return user?.apiToken ?? '';
    }
  }

  static logout() async {
    await sharedPreferences.remove(SharedConstant.childKey);
    await sharedPreferences.remove(SharedConstant.dataForUserRegistrationKey);
    await sharedPreferences.remove(SharedConstant.selectedChildKey);
    await sharedPreferences.remove(SharedConstant.userKey);
  }
}
