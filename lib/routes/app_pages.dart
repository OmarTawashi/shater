import 'package:get/get.dart';
import 'package:shater/modules/screens/auth/base%20login/view/base_login_screen.dart';
import 'package:shater/modules/screens/auth/sign%20in/view/sign_in_screen.dart';
import 'package:shater/modules/screens/auth/sign%20up/bindings/sign_up_bindings.dart';
import 'package:shater/modules/screens/auth/sign%20up/view/sign_up_screen.dart';
import 'package:shater/modules/screens/dashBord/bindings/bindings_dashbord.dart';
import 'package:shater/modules/screens/dashBord/view/dashbord_screen.dart';
import 'package:shater/modules/screens/dashBord/widgets/semester_screen.dart';
import 'package:shater/modules/screens/edit%20profile/view/edit_profile_screen.dart';
import 'package:shater/modules/screens/exercise%20subject/bindings/exercise_subject_bindings.dart';
import 'package:shater/modules/screens/exercise%20subject/view/exercise_subject_screen.dart';
import 'package:shater/modules/screens/firsts/view/first_screen.dart';
import 'package:shater/modules/screens/notification/view/notification_screen.dart';
import 'package:shater/routes/app_routes.dart';

import '../modules/screens/auth/sign in/bindings/signin_binding.dart';
import '../modules/screens/contact/view/contact_screen.dart';
import '../modules/screens/splach/view/splash_screen.dart';
import '../modules/screens/teacher/view/teacher_screen.dart';

class AppPages {
  AppPages._();

  static List<GetPage<dynamic>> routes = [
    GetPage(name: RoutesName.spalshScreen, page: () => const SplashScreen()),
    GetPage(
        name: RoutesName.dashBoardScreen,
        page: () => const DashBoardScreen(),
        binding: DashBoardBindings()),
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
      page: () =>  SignUpScreen(),
      binding: SignUpBinding()
    ),
    GetPage(
        name: RoutesName.signInScreen,
        page: () =>  SignInScreen(), //SignInController
        binding: SignInBinding()),
    GetPage(
      name: RoutesName.firstsScreen,
      page: () => const FirstsScreen(),
    ),
    GetPage(
      name: RoutesName.contactScreen,
      page: () => const ContactScreen(),
    ),
    GetPage(
      name: RoutesName.contactScreen,
      page: () => const ContactScreen(),
    ),
    GetPage(
      name: RoutesName.notificationDetails,
      page: () => const NotificationDetails(),
    ),
    GetPage(
        name: RoutesName.exerciseSubjectScreen,
        page: () => const ExerciseSubjectScreen(),
        binding: ExerciseSubjectBinding()),
    GetPage(
        name: RoutesName.semesterScreen,
        page: () => const SemesterScreen(),
        binding: BindingsBuilder(() {})),
  ];
}
