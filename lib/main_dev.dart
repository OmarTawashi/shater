import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shater/flavors/build_config.dart';
import 'package:shater/flavors/env_config.dart';
import 'package:shater/flavors/myapp.dart';

import 'core/controller/init_app.dart';
import 'flavors/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final languages = await InitApp.initLanguage();
  SharedPreferences shared = await SharedPreferences.getInstance();
  Get.lazyPut(() => shared);
  EnvConfig devConfig = EnvConfig(
    appName: "Shatter App Dev",
    baseUrl: "https://test.shattir.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(MyApp(
    languages: languages,
  ));
}
