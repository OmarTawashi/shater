import 'package:get/get.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/views/screens/dashBord/controller/dashboard_controller.dart';
import 'package:shater/views/screens/dashBord/view/dashbord_screen.dart';
import 'package:shater/views/screens/firsts/view/first_screen.dart';

import '../views/screens/profile/view/profile_screen.dart';
import '../views/screens/results/view/result_screen.dart';
import '../views/screens/splach/view/splash_screen.dart';
import '../views/screens/teachers/controller/teachers_controller.dart';

class AppPages {
  AppPages._();

  static List<GetPage<dynamic>> routes = [
    GetPage(name: RoutesName.spalshScreen, page: () => const SplashScreen()),
    GetPage(
        name: RoutesName.dashBoardScreen,
        page: () => const DashBoardScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => DashBoardController());
          Get.lazyPut(() => TeacherController());
        })),
    GetPage(
      name: RoutesName.profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: RoutesName.firstsScreen,
      page: () => const FirstsScreen(),
    ),
    GetPage(
      name: RoutesName.resultScreen,
      page: () => const ResultScreen(),
    ),
  ];
}
