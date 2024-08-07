import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/privcy%20policy/privcy/privcy_screen.dart';
import 'package:shater/presentation/privcy%20policy/terms/terms_condition.dart';
import 'package:shater/presentation/screens/add%20child/view/add_child_screen.dart';
import 'package:shater/presentation/screens/auth/base%20login/view/base_login_screen.dart';
import 'package:shater/presentation/screens/auth/forget%20password/binding/forget_password_binding.dart';
import 'package:shater/presentation/screens/auth/forget%20password/view/forget_password_screen.dart';
import 'package:shater/presentation/screens/auth/resgister/binding/register_binding.dart';
import 'package:shater/presentation/screens/auth/resgister/view/create_name_screen.dart';
import 'package:shater/presentation/screens/auth/sign%20in/view/sign_in_screen.dart';
import 'package:shater/presentation/screens/auth/sign%20up/bindings/sign_up_bindings.dart';
import 'package:shater/presentation/screens/auth/sign%20up/view/sign_up_screen.dart';
import 'package:shater/presentation/screens/city/bindings/city_binding.dart';
import 'package:shater/presentation/screens/classe/binding/classe_binding.dart';
import 'package:shater/presentation/screens/classe/view/classe_screen.dart';
import 'package:shater/presentation/screens/edit%20profile/binding/edit_profile_binding.dart';
import 'package:shater/presentation/screens/edit%20profile/take%20image/widget/grid_avatar_view.dart';
import 'package:shater/presentation/screens/level/bindings/level_bindings.dart';
import 'package:shater/presentation/screens/level/view/level_screen.dart';
import 'package:shater/presentation/screens/profile/bindings/profile_binding.dart';
import 'package:shater/presentation/screens/profile/view/main_profile_screen.dart';
import 'package:shater/presentation/screens/school/binding/school_bindings.dart';
import 'package:shater/presentation/screens/school/view/school_screen.dart';
import 'package:shater/presentation/screens/splach/binding/spalch_binding.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/view/exercise_contact_screen.dart';
import 'package:shater/presentation/screens/student/questions/base/binding/base_question_binding.dart';
import 'package:shater/presentation/screens/student/questions/base/view/base_question_screen.dart';
import 'package:shater/presentation/screens/student/questions/congrlate/binding/congrlate_binding.dart';
import 'package:shater/presentation/screens/student/questions/congrlate/view/congrlate_screen.dart';
import 'package:shater/presentation/screens/student/questions/failure%20question/binding/failure_question_binding.dart';
import 'package:shater/presentation/screens/student/questions/failure%20question/view/failure_question_screen.dart';
import 'package:shater/presentation/screens/student/dashBord/bindings/bindings_dashbord.dart';
import 'package:shater/presentation/screens/student/dashBord/view/dashbord_screen.dart';
import 'package:shater/presentation/screens/student/exercise%20details/view/exercise_details_screen.dart';
import 'package:shater/presentation/screens/student/exercise%20subject/bindings/exercise_subject_bindings.dart';
import 'package:shater/presentation/screens/student/exercise%20subject/view/exercise_subject_screen.dart';
import 'package:shater/presentation/screens/student/firsts/view/first_screen.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/contact_me/binding/contact_me_binding.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/contact_me/view/contact_me_screen.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/notification/view/notification_screen.dart';
import 'package:shater/presentation/screens/student/pages%20subject/binding/page_subject_binding.dart';
import 'package:shater/presentation/screens/student/pages%20subject/view/page_subject_screen.dart';
import 'package:shater/presentation/screens/student/questions/lesson/widget/lesson_teacher_view.dart';
import 'package:shater/presentation/screens/student/result%20subject/binding/result_subject_binding.dart';
import 'package:shater/presentation/screens/student/result%20subject/view/result_subject_screen.dart';
import 'package:shater/presentation/screens/student/subcription%20teacher%20details/bindings/subcription_teacher_details_binding.dart';
import 'package:shater/presentation/screens/student/subcription%20teacher%20details/view/subcription_teacher_details_screen.dart';
import 'package:shater/presentation/screens/student/subject%20teacher/binding/subject_teacher_binding.dart';
import 'package:shater/presentation/screens/student/subject%20teacher/view/subject_teacher_screen.dart';
import 'package:shater/presentation/screens/edit%20profile/take%20image/binding/take_image_binding.dart';
import 'package:shater/presentation/screens/edit%20profile/take%20image/view/take_image_screen.dart';
import 'package:shater/presentation/screens/student/teacher%20details/binding/teacher_details_binding.dart';
import 'package:shater/presentation/screens/student/teacher%20details/view/teacher_details_screen.dart';
import 'package:shater/presentation/screens/teacher/Explanation/selected_page_exercise_controller_.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/add_exercise_screen.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/teacher_exercise_subject_screen.dart';
import 'package:shater/presentation/screens/teacher/My%20Explanation/teacher_my_lessons_bindings.dart';
import 'package:shater/presentation/screens/teacher/Teacher%20Pages%20Explained/teacher_pages_lessons_binding%20.dart';
import 'package:shater/presentation/screens/teacher/Teacher%20Pages%20Explained/teacher_pages_lessons_screen.dart';
import 'package:shater/presentation/screens/teacher/teacher%20dashborad/view/teacher_dashbord_screen.dart';
import 'package:shater/routes/app_routes.dart';

import '../presentation/screens/add child/binding/add_child_binding.dart';
import '../presentation/screens/city/view/city_screen.dart';
import '../presentation/screens/edit profile/view/student/edit_student_profile_screen.dart';
import '../presentation/screens/splach/view/splash_screen.dart';
import '../presentation/screens/teacher/Explanation/teacher_explanation_bindings.dart';
import '../presentation/screens/teacher/Explanation/view/add_excercise/selected_page_exercise_screen.dart';
import '../presentation/screens/teacher/My Explanation/teacher_my_lessons_screen.dart';
import '../presentation/screens/teacher/teacher dashborad/bindings/teacher_bindings_dashbord.dart';

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
    GetPage(
      name: RoutesName.teacherDashBoardScreen,
      page: () => const TeacherDashBoardScreen(),
      binding: TeacherDashBoardBindings(),
    ),
    GetPage(
      name: RoutesName.subcriptionTeacherDetailsScreen,
      page: () => const SubcriptionTeacherDetailsScreen(),
      binding: SubcriptionTeacherDetailsBinding(),
    ),
    GetPage(
      name: RoutesName.lessonTeacherView,
      page: () => LessonTeacherView(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage(
      name: RoutesName.teacherDetailsScreen,
      page: () => const TeacherDetailsScreen(),
      binding: TeacherDetailsBinding(),
    ),
    GetPage(
      name: RoutesName.editProfileScreen,
      page: () => const EditStudentProfileScreen(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: RoutesName.addChildScreen,
      page: () => const AddChildScreen(),
      binding: AddChildBinding(),
    ),
    GetPage(
        name: RoutesName.resultSubjectScreen,
        page: () => const ResultSubjectScreen(),
        binding: ResultSubjectBinding()),
    GetPage(
      name: RoutesName.baseLoginScreen,
      page: () => const BaseLoginScreen(),
    ),
    GetPage(
      name: RoutesName.exerciseDetailsScreen,
      page: () => const ExerciseDetailsScreen(),
    ),
    GetPage(name: RoutesName.profileScreen, page: () => const MainProfileScreen(), binding: ProfileBinding()),
    GetPage(name: RoutesName.createNameScreen, page: () => CreateNameScreen(), binding: RegisterBinding()),
    GetPage(name: RoutesName.takeImageScreen, page: () => TakeImageScreen(typeFrom: 0,), binding: TakeImageBinding()),
    // GetPage(
    //     name: RoutesName.profileScreen,
    //     page: () => const ProfileScreen(),
    //     binding: ProfileBinding()),
    GetPage(
        name: RoutesName.createNameScreen,
        page: () => CreateNameScreen(),
        binding: RegisterBinding()),
    // GetPage(
    //     name: RoutesName.takeImageScreen,
    //     page: () => TakeImageScreen(),
    //     binding: TakeImageBinding()),
    GetPage(
      name: RoutesName.gridViewAvatar,
      page: () => GridViewAvatar(typeFrom: 0,),
    ),
    GetPage(
        name: RoutesName.forgetPasswordScreen,
        page: () => ForgetPasswordScreen(),
        binding: ForgetPasswordBinding()),
    GetPage(
        name: RoutesName.subjectTeacherScreen,
        page: () => const SubjectTeacherScreen(typeFrom: 0,),
        binding: SubjectTeacherBinding()),
    GetPage(
      name: RoutesName.termsConditionScreen,
      page: () => const TermsConditionScreen(),
    ),
    GetPage(
      name: RoutesName.privcyPolicyScreen,
      page: () => const PrivcyPolicyScreen(),
    ),
    GetPage(name: RoutesName.classeScreen, page: () => const ClasseScreen(typeFrom: 0,), binding: ClasseBinding(0)),
    GetPage(name: RoutesName.cityScreen, page: () => cityScreen(typeFrom: 0,), binding: CityBinding()),
    GetPage(name: RoutesName.schoolScreen, page: () => const SchoolScreen(typeFrom: 0,), binding: SchoolBinding(0)),
    GetPage(name: RoutesName.signUpScreen, page: () => SignUpScreen(), binding: SignUpBinding()),
    // GetPage(
    //     name: RoutesName.classeScreen,
    //     page: () => const ClasseScreen(),
    //     binding: ClasseBinding()),
    // GetPage(
    //     name: RoutesName.cityScreen,
    //     page: () => cityScreen(),
    //     binding: CityBinding()),
    // GetPage(
    //     name: RoutesName.schoolScreen,
    //     page: () => const SchoolScreen(),
    //     binding: SchoolBinding()),
    GetPage(
        name: RoutesName.signUpScreen,
        page: () => SignUpScreen(),
        binding: SignUpBinding()),
    GetPage(
        name: RoutesName.signInScreen,
        page: () => SignInScreen(), //SignInController
        ),
    GetPage(
      name: RoutesName.firstsScreen,
      page: () => const FirstsScreen(),
    ),
    GetPage(
      name: RoutesName.contactScreen,
      page: () => const ExerciseContactScreen(),
    ),
    GetPage(
        name: RoutesName.baseQuestionScreen,
        page: () => const BaseQuestionScreen(),
        binding: BaseQuestionBinding()),
    GetPage(
        name: RoutesName.congrlateScreen,
        page: () => const CongrlateScreen(),
        binding: CongralteBinding(),
        transition: Transition.downToUp,
        transitionDuration: Duration.zero),
    GetPage(
        name: RoutesName.failureQuestionScrren,
        page: () => const FailureQuestionScrren(),
        binding: FailureQuestionBinding(),
        transition: Transition.downToUp,
        transitionDuration: Duration.zero),
    GetPage(
        name: RoutesName.contactMeScreen,
        page: () => const ContactMeScreen(),
        binding: ContactMeBinding()),
    GetPage(
        name: RoutesName.pageSubjectScreen,
        page: () => const PageSubjectScreen(),
        binding: PageSubjectBinding()),
    GetPage(
      name: RoutesName.notificationDetails,
      page: () => const NotificationDetails(),
    ),
    GetPage(
        name: RoutesName.exerciseSubjectScreen,
        page: () => const ExerciseSubjectScreen(),
        binding: ExerciseSubjectBinding()),
    GetPage(
        name: RoutesName.levelScreen,
        page: () => const LevelScreen(),
        binding: LevelBindings()),
    GetPage(
        name: RoutesName.teacherPagesLessonsScreen,
        page: () => const TeacherPagesLessonsScreen(),
        binding: TeacherPagesLessonsBinding()),
    GetPage(
        name: RoutesName.teacherMyLessonsScreen,
        page: () => const TeacherMyLessonsScreen(),
        binding: TeacherMyLessonsBinding()),
    GetPage(
        name: RoutesName.dashBoardScreen,
        page: () => const DashBoardScreen(),
        binding: DashBoardBindings()),
    GetPage(
      name: RoutesName.teacherExerciseSubjectScreen,
      page: () => TeacherExerciseSubjectScreen(),
      binding: TeacherExplanationBinding(),
    ),
    GetPage(
      name: RoutesName.selectedPageExerciseScreen,
      page: () => SelectedPageEerciseScreen(),
      binding: SelectedPageExerciseBinding(),
    ),
    GetPage(
        name: RoutesName.selectedPageExerciseScreen,
        page: () => const SelectedPageEerciseScreen(),
        binding: SpalchBinding()),
    GetPage(
        name: RoutesName.teacherAddExercise,
        page: () => const AddExerciseScreen(),
        binding: SpalchBinding()),
  ];
}
//