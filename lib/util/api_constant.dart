import 'package:get/get.dart';
import 'package:shater/flavors/build_config.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/auth/base%20login/widgets/auth_mixin.dart';

class ApiConstant {
  // Base
  static String baseUrl = BuildConfig.instance.config.baseUrl;

  //student

  static String textUser = Get.find<AuthController>().userType.user;
  static String version = 'v2';
  static String checkEmail = '/api/$version/$textUser/auth/check-email';
  static String studentLogin = '/api/$version/auth/login';
  static String ForgetPassword = '/api/$version/auth/password/email';
  static String registerLogin = '/api/$version/$textUser/auth/register';
  static String getCities = '/api/$version/main/getCities';
  static String getSchools = '/api/$version/main/getSchools';
  static String getSubjects = '/api/$version/main/getSubjects';
  static String getDataForUserRegistration =
      '/api/$version/getDataForUserRegistration';

  static const String topic = 'all_zone_customer';
}
