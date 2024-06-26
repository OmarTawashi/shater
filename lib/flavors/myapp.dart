import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/localization_controller.dart';
import 'package:shater/core/controller/root_binding.dart';
import 'package:shater/flavors/env_config.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/bootom_sheet_widget.dart';
import 'package:shater/routes/app_routes.dart';

import '../routes/app_pages.dart';
import '../util/constant.dart';
import '../util/messages.dart';
import '../util/theme.dart';
import 'build_config.dart';

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;
  const  MyApp({super.key, this.languages});

  @override
  Widget build(BuildContext context) {
    final EnvConfig _envConfig = BuildConfig.instance.config;
    return ScreenUtilInit(
      designSize: const Size(414, 905), //Size(768, 1024) is sized ipad
      splitScreenMode: true,
      builder: (BuildContext context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeApp.materialLightTheme(),
          defaultTransition: Transition.cupertino,
          initialBinding: RootBinding(),
          // home: TestPage(),
          initialRoute: RoutesName.spalshScreen,
          locale: Get.find<LocalizationController>().locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(APPCONSTANT.languages[1].languageCode!,
              APPCONSTANT.languages[1].countryCode),
          getPages: AppPages.routes),
    );
  }
}
