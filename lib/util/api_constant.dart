import 'dart:io';

import 'package:get/get.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/flavors/build_config.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/auth/base%20login/widgets/auth_mixin.dart';

class ApiConstant {
  // Base
  static String baseUrl = BuildConfig.instance.config.baseUrl;
  static String baseUrl2 = 'https://test.shattir.com';

  //student

  static String textUser = Get.find<AuthController>().userType.user;
  static bool isTeacher = Get.find<AuthController>().userType == AuthType.teacher;
  static String version = 'v2';
  static String checkEmail = '/api/$version/teacher/auth/check-email';
  static String studentLogin = '/api/$version/auth/login';
  static String childLogin = '/api/$version/auth/login-child';
  static String ForgetPassword = '/api/$version/auth/password/email';
  static String registerSudent = '/api/$version/auth/register';
  static String logout = '/api/$version/auth/logout';
  static String deleteAccount = '/api/$version/auth/delete-account';
  static String registerTeacher = '/api/$version/$textUser/auth/register';
  static String coursesLearning = '/api/$version/$textUser/educational/courses/learning';
  static String schoolsRates = '/api/$version/student/rates/schools';
  static String studentRates = '/api/$version/student/rates/students';
  static String studentProfile = '/api/$version/student/profile/my-profile';
  static String updateStudentProfile = '/api/$version/student/profile/update';
  static String updateTeacherProfile = '/api/$version/teacher/profile/update';
  static String registerChild(int id) => '/api/$version/auth/register-child/$id';
  static String teacherProfile = '/api/$version/teacher/profile/index';
  static String teacherQualifications(int id) => '/api/v3/teacher/profile/qualifications/$id/index';
  static String teacherAddQualifications(int id) => '/api/v3/teacher/profile/qualifications/$id/update';
  static String examSubject = '/api/$version/student/educational/exams/subject';
  static String shareExam = '/api/$version/student/educational/exams/result';
  static String commentsList = '/api/$version/student/comments/list';
  static String commentStore = '/api/$version/student/comments/store';
  static String rateVideo = '/api/rateVideo';
  static String teacherOfStudent = '/api/$version/student/educational/videos/get-teachers-for-subject';

  static String notifications = '/api/$version/student/notifications/list';
  static String teacherAsRead = '/api/$version/student/notifications/mark-as-read';
  static String contactList = '/api/$version/student/contacts/list';
  static String contactStore = '/api/$version/student/contacts/store';
  static String replayContact = '/api/$version/student/contacts';
  static String storeAnswer = '/api/$version/student/educational/exams/store-answer';

  static String questionsPage = '/api/$version/student/educational/questions/pages';
  static String questionsSubject = '/api/$version/student/educational/questions/subject';

  static String getCities = '/api/$version/main/getCities';
  static String getSchools = '/api/$version/main/getSchools';
  static String getSubjects = '/api/$version/main/getSubjects';
  static String getClasses = '/api/$version/main/getClasses';
  static String getDataForUserRegistration = '/api/$version/getDataForUserRegistration';

  static String getTeacherCoursesLesson = '/api/$version/teacher/lesson/index?level=';
  static String teacherCoursesList = '/api/$version/teacher/lesson/index2?level=';
  static String getVideoOfSubject = '/api/v2/student/educational/videos/get-videos-for-subject';
  static String getVideoOfPage = '/api/v2/student/educational/videos/get-videos-for-page';

  static const String topic = 'all_zone_customer';


  // headers

  static Map<String, dynamic>? getHeader(String token){
    Map<String, dynamic> header =  {
      HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json',
    "device-type": "ios",
    "site_country": "",
    "Accept-Language": "ar",
    "Authorization": "Bearer ${token}"

    // 'X-Client-Device-Name': DeviceInfo.deviceName,
    // 'X-Client-Device-Type': DeviceInfo.manufacturerName,
    // 'X-Client-Platform-Name': DeviceInfo.systemName,
    // 'X-Client-Platform-Version': DeviceInfo.systemVersion,
  };
    return header;
  }

  static Map<String, String> header(TypeToken token, {String? customHeader}) {
    Map<String, String> headers = {};
    if (token == TypeToken.Content_Type) {
      headers = {
        'Content-Type': 'application/json',
      };
    } else if (token == TypeToken.Authorization) {
      headers = {
        'Authorization': 'Bearer ${SharedPrefs.user?.apiToken}',
      };
    } else if (token == TypeToken.Authorization_Content) {
      headers = {
        'Authorization': 'Bearer ${SharedPrefs.user?.apiToken}',
        'Content-Type': 'application/json',
      };
    } else if (token == TypeToken.Authorization_Content_urlencoded) {
      headers = {
        'Authorization': 'Bearer ${SharedPrefs.user?.apiToken}',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
    } else if (token == TypeToken.Authorization_Custom_header) {
      headers = {
        'Authorization': 'Bearer $customHeader',
        'Content-Type': 'application/json',
      };
    }
    return headers;
  }

}

enum TypeToken {
  //todo this for application/json
  Content_Type,
  //todo this for Authorization Bearer
  Authorization,
  //todo this for Authorization Bearer &&  Content_Type
  Authorization_Content,
//todo this for Authorization Bearer &&  Content_Type application/x-www-form-urlencode
  Authorization_Content_urlencoded,
  //todo this for Custom Authorization Bearer &&  Content_Type application/x-www-form-urlencode
  Authorization_Custom_header
}
