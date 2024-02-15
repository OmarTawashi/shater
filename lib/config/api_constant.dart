
import 'package:shater/flavors/build_config.dart';

class ApiConstant {
  // Base
  static String baseUrl = BuildConfig.instance.config.baseUrl;


  //student
  static const String textUser = 'student';
  static const String version = 'v2';
  static const String checkEmail = '/api/$version/$textUser/auth/check-email';


  
}
