import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/localization_controller.dart';
import '../controller/root_binding.dart';
import '../routes/app_pages.dart';
import '../routes/app_routes.dart';
import '../util/constant.dart';
import '../util/messages.dart';
import '../util/theme.dart';

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;
  const MyApp({super.key, this.languages});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 905),
        splitScreenMode: true,
        builder: (BuildContext context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
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
