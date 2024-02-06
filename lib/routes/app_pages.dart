import 'package:get/get.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/views/screens/auth/base%20login/view/base_login_screen.dart';
import 'package:shater/views/screens/auth/sign%20in/view/sign_in_screen.dart';
import 'package:shater/views/screens/auth/sign%20up/view/sign_up_screen.dart';
import 'package:shater/views/screens/dashBord/controller/dashboard_controller.dart';
import 'package:shater/views/screens/dashBord/view/dashbord_screen.dart';
import 'package:shater/views/screens/firsts/view/first_screen.dart';

import '../views/screens/firsts/controller/firsts_controller.dart';
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
          Get.lazyPut(() => FirstsController());
        })),
    GetPage(
      name: RoutesName.profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: RoutesName.baseLoginScreen,
      page: () => const BaseLoginScreen(),
    ),
    GetPage(
      name: RoutesName.signUpScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: RoutesName.signInScreen,
      page: () => const SignInScreen(),
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
