import 'package:get/get.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/views/screens/auth/base%20login/view/base_login_screen.dart';
import 'package:shater/views/screens/auth/sign%20in/view/sign_in_screen.dart';
import 'package:shater/views/screens/auth/sign%20up/view/sign_up_screen.dart';
import 'package:shater/views/screens/contact/controller/contact_controller.dart';
import 'package:shater/views/screens/dashBord/controller/dashboard_controller.dart';
import 'package:shater/views/screens/dashBord/view/dashbord_screen.dart';
import 'package:shater/views/screens/dashBord/widgets/semester_screen.dart';
import 'package:shater/views/screens/edit%20profile/view/edit_profile_screen.dart';
import 'package:shater/views/screens/exercise%20subject/controller/exercise_subject_controller.dart';
import 'package:shater/views/screens/exercise%20subject/view/exercise_subject_screen.dart';
import 'package:shater/views/screens/firsts/view/first_screen.dart';

import '../views/screens/auth/sign in/controller/sign_in_controller.dart';
import '../views/screens/contact/view/contact_screen.dart';
import '../views/screens/exercises/controller/exercise_controller.dart';
import '../views/screens/firsts/controller/firsts_controller.dart';
import '../views/screens/splach/view/splash_screen.dart';
import '../views/screens/subject/controller/subjects_controller.dart';
import '../views/screens/teacher/controller/teacher_controller.dart';
import '../views/screens/teacher/view/teacher_screen.dart';

class AppPages {
  AppPages._();

  static List<GetPage<dynamic>> routes = [
    GetPage(name: RoutesName.spalshScreen, page: () => const SplashScreen()),
    GetPage(
        name: RoutesName.dashBoardScreen,
        page: () => const DashBoardScreen(),
        binding: BindingsBuilder(() {
          Get.lazyPut(() => DashBoardController());
          Get.lazyPut(() => SubjectController());
          Get.lazyPut(() => ExerciseController());
          Get.lazyPut(() => FirstsController());
          Get.lazyPut(() => TeacherController());
          Get.lazyPut(() => ContactController());
        })),
    GetPage(
      name: RoutesName.profileScreen,
      page: () => const TeacherScreen(),
    ),
    GetPage(
      name: RoutesName.editProfileScreen,
      page: () => const EditProfileScreen(),
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
        page: () => const SignInScreen(), //SignInController
        binding: BindingsBuilder(() {
          Get.lazyPut(() => SignInController());
        })),
    GetPage(
      name: RoutesName.firstsScreen,
      page: () => const FirstsScreen(),
    ),
    GetPage(
      name: RoutesName.contactScreen,
      page: () => const ContactScreen(),
    ),
    GetPage(
      name: RoutesName.exerciseSubjectScreen,
      page: () => const ExerciseSubjectScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ExerciseSubjectController());
      })
    ),
    GetPage(
      name: RoutesName.semesterScreen,
      page: () => const SemesterScreen(),
      binding: BindingsBuilder(() {
        
      })
    ),
  ];
}
