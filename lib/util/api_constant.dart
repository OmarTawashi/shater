
import 'package:shater/flavors/build_config.dart';

class ApiConstant {
  // Base
  static String baseUrl = BuildConfig.instance.config.baseUrl;


  //student
  static const String textUser = 'student';
  static const String version = 'v2';
  static const String checkEmail = '/api/$version/auth/check-email';
  static const String studentLogin = '/api/$version/auth/login';
  static const String registerLogin = '/api/$version/auth/register';
  static const String getCities = '/api/$version/main/getCities';
  static const String getSchools = '/api/$version/main/getSchools';
  static const String getDataForUserRegistration = '/api/$version/getDataForUserRegistration';






  static const String topic = 'all_zone_customer';


  
}
