import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shater/flavors/app_config.dart';
import 'package:shater/flavors/myapp.dart';

import '../controller/init_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languages = await InitApp.initLanguage();
  SharedPreferences shared = await SharedPreferences.getInstance();
  Get.lazyPut(() => shared);
  BuildEnvironment.init(
      flavor: BuildFlavor.production, baseUrl: 'https://shattir.com');
  assert(env != null);
  runApp(MyApp(
    languages: languages,
  ));
}
