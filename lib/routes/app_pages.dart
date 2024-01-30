import 'package:get/get.dart';
import 'package:shater/routes/app_routes.dart';

import '../views/screens/splach/view/splash_screen.dart';

class AppPages {
  AppPages._();

  static List<GetPage<dynamic>> routes = [
    GetPage(name: RoutesName.spalshScreen, page: () => const SplashScreen()),
  ];
}
