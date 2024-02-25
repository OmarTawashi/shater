import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/base%20login/view/base_login_screen.dart';
import 'package:shater/presentation/screens/auth/sign%20in/view/sign_in_screen.dart';
import 'package:shater/presentation/screens/auth/sign%20up/bindings/sign_up_bindings.dart';
import 'package:shater/presentation/screens/auth/sign%20up/view/sign_up_screen.dart';
import 'package:shater/presentation/screens/auth/sign%20up/widgets/create_name_screen.dart';
import 'package:shater/presentation/screens/city/bindings/city_binding.dart';
import 'package:shater/presentation/screens/dashBord/bindings/bindings_dashbord.dart';
import 'package:shater/presentation/screens/dashBord/view/dashbord_screen.dart';
import 'package:shater/presentation/screens/dashBord/widgets/semester_screen.dart';
import 'package:shater/presentation/screens/edit%20profile/view/edit_profile_screen.dart';
import 'package:shater/presentation/screens/exercise%20details/view/exercise_details_screen.dart';
import 'package:shater/presentation/screens/exercise%20subject/bindings/exercise_subject_bindings.dart';
import 'package:shater/presentation/screens/exercise%20subject/view/exercise_subject_screen.dart';
import 'package:shater/presentation/screens/firsts/view/first_screen.dart';
import 'package:shater/presentation/screens/level/binding/level_binding.dart';
import 'package:shater/presentation/screens/level/view/level_screen.dart';
import 'package:shater/presentation/screens/notification/view/notification_screen.dart';
import 'package:shater/presentation/screens/profile/view/profile_screen.dart';
import 'package:shater/presentation/screens/school/binding/school_bindings.dart';
import 'package:shater/presentation/screens/school/view/school_screen.dart';
import 'package:shater/presentation/screens/splach/binding/spalch_binding.dart';
import 'package:shater/routes/app_routes.dart';

import '../presentation/screens/auth/sign in/bindings/signin_binding.dart';
import '../presentation/screens/city/view/city_screen.dart';
import '../presentation/screens/contact/view/contact_screen.dart';
import '../presentation/screens/splach/view/splash_screen.dart';

class AppPages {
  AppPages._();

  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: RoutesName.spalshScreen,
        page: () => const SplashScreen(),
        binding: SpalchBinding()),
    GetPage(
        name: RoutesName.dashBoardScreen,
        page: () => const DashBoardScreen(),
        binding: DashBoardBindings()),
    // GetPage(
    //   name: RoutesName.TeacherScreen,
    //   page: () => const TeacherScreen(),
    // ),
    GetPage(
      name: RoutesName.editProfileScreen,
      page: () => const EditProfileScreen(),
    ),
    GetPage(
      name: RoutesName.baseLoginScreen,
      page: () => const BaseLoginScreen(),
    ),
    GetPage(
      name: RoutesName.exerciseDetailsScreen,
      page: () => const ExerciseDetailsScreen(),
    ),
    GetPage(
      name: RoutesName.profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: RoutesName.createNameScreen,
      page: () =>  CreateNameScreen(),
    ),
    GetPage(
      name: RoutesName.levelScreen,
      page: () => const LevelScreen(),
     binding:  LevelBinding()
    ),
    GetPage(
      name: RoutesName.cityScreen,
      page: () =>  cityScreen(),
      binding: CityBinding()
    ),
    GetPage(
      name: RoutesName.schoolScreen,
      page: () => const SchoolScreen(),
      binding: SchoolBinding()
    ),
    GetPage(
        name: RoutesName.signUpScreen,
        page: () => SignUpScreen(),
        binding: SignUpBinding()),
    GetPage(
        name: RoutesName.signInScreen,
        page: () => SignInScreen(), //SignInController
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
