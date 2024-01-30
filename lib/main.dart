import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/routes/app_pages.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shater',
            theme: ThemeApp.materialLightTheme(),
            initialRoute: RoutesName.spalshScreen,
            getPages: AppPages.routes));
  }
}
