import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shater/controller/init_app.dart';
import 'package:shater/controller/root_binding.dart';
import 'package:shater/routes/app_pages.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/theme.dart';

import 'controller/localization_controller.dart';
import 'util/constant.dart';
import 'util/messages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languages = await InitApp.initLanguage();
  SharedPreferences shared = await SharedPreferences.getInstance();
  Get.lazyPut(() => shared);
  runApp(MyApp(
    languages: languages,
  ));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;
  const MyApp({super.key, this.languages});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 905),
        splitScreenMode: true,
        builder: (BuildContext context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shater',
            theme: ThemeApp.materialLightTheme(),
            defaultTransition: Transition.cupertino,
            initialBinding: RootBinding(),
            initialRoute: RoutesName.spalshScreen,
            locale: Get.find<LocalizationController>().locale,
            translations: Messages(languages: languages),
            fallbackLocale: Locale(APPCONSTANT.languages[1].languageCode!,
                APPCONSTANT.languages[1].countryCode),
            getPages: AppPages.routes));
  }
}
