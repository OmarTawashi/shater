import 'package:shater/flavors/app_config.dart';

class ApiConstant {
  // Base
  static String baseUrl = BuildEnvironment.baseUrlUse ?? '';


  //student
  static const String textUser = 'student';
  static const String version = 'v2';
  static const String checkEmail = '/api/$version/$textUser/auth/check-email';
}
