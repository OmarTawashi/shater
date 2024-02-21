import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shater/util/api_constant.dart';

import '../../../../util/shared_constant.dart';

class SplachController extends GetxController {
    SharedPreferences? sharedPreferences;

  @override
  onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2)).then(
      (_) {
        saveToken();
      },
    );
  }

  Future<String> saveToken() async {
    String _deviceToken = '';
    if (GetPlatform.isIOS && !GetPlatform.isWeb) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
              alert: true, badge: true, sound: true);
      NotificationSettings settings =
          await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      // await Future.delayed(Duration(seconds: 1));
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        _deviceToken = await _saveDeviceToken();
      }
    } else {
      _deviceToken = await _saveDeviceToken();
    }
    if (!GetPlatform.isWeb) {
      FirebaseMessaging.instance.subscribeToTopic(ApiConstant.topic);
    }
    update();

    return _deviceToken;
  }

  Future<String> _saveDeviceToken() async {
    String deviceToken = '';
    if (!GetPlatform.isWeb) {
      try {
        deviceToken = (await FirebaseMessaging.instance.getToken()) ?? '';
        Get.find<SharedPreferences>()
            .setString(SharedConstant.fcmTokenKey, deviceToken);
      } catch (e) {
        deviceToken =
            sharedPreferences?.getString(SharedConstant.fcmTokenKey) ?? '';
      }
    }
    if (deviceToken.isNotEmpty) {
      print('--------Device Token---------- ' + deviceToken);
    }
    update();
    return deviceToken;
  }
}
