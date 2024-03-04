import 'package:get/get.dart';
import 'package:shater/flavors/build_config.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/auth/base%20login/widgets/auth_mixin.dart';

class ApiConstant {
  // Base
  static String baseUrl = BuildConfig.instance.config.baseUrl;

  //student

  static String textUser = Get.find<AuthController>().userType.user;
  static bool isTeacher =
      Get.find<AuthController>().userType == AuthType.teacher;
  static String version = 'v2';
  static String checkEmail = '/api/$version/teacher/auth/check-email';
  static String studentLogin = '/api/$version/auth/login';
  static String ForgetPassword = '/api/$version/auth/password/email';
  static String registerSudent = '/api/$version/auth/register';
  static String registerTeacher = '/api/$version/$textUser/auth/register';
  static String coursesLearning =
      '/api/$version/$textUser/educational/courses/learning';
  static String schoolsRates = '/api/$version/student/rates/schools';
  static String studentRates = '/api/$version/student/rates/students';

  static String getCities = '/api/$version/main/getCities';
  static String getSchools = '/api/$version/main/getSchools';
  static String getSubjects = '/api/$version/main/getSubjects';
  static String getClasses = '/api/$version/main/getClasses';
  static String getDataForUserRegistration =
      '/api/$version/getDataForUserRegistration';

  static const String topic = 'all_zone_customer';
}
