import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shater/flavors/myapp.dart';
import 'package:shater/util/dio_manager/dio_manage_class.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'core/controller/init_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final languages = await InitApp.initLanguage();
  SharedPreferences shared = await SharedPreferences.getInstance();
  Get.lazyPut(() => shared);
  DioManagerClass.getInstance.init();
  EnvConfig prodConfig = EnvConfig(
    appName: "Shatter App prod",
    baseUrl: "https://shattir.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  runApp(MyApp(
    languages: languages,
  ));
}
