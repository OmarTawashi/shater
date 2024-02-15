import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shater/flavors/myapp.dart';

import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';
import 'controller/init_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languages = await InitApp.initLanguage();
  SharedPreferences shared = await SharedPreferences.getInstance();
  Get.lazyPut(() => shared);
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
