import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/contact/controller/contact_controller.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/controller/exercise_contact_controller.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/notification/controller/notification_controller.dart';

import '../../../student/dashBord/controller/dashboard_controller.dart';
import '../../../student/exericse & contact/exercises/controller/exercise_controller.dart';
import '../../../student/firsts/controller/firsts_controller.dart';
import '../../../student/subject/controller/subjects_controller.dart';
import '../../../student/teacher/controller/teacher_controller.dart';
import '../../Explanation/teacher_explanation_controller.dart';
import '../../My Explanation/teacher_my_lessons_controller.dart';
import '../../practice/practice_controller.dart';
import '../controller/teacher_dashboard_controller.dart';

class TeacherDashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherDashBoardController>(() => TeacherDashBoardController());
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut(() => TeacherMyLessonsController());
    Get.lazyPut(() => PracticeController());
    Get.lazyPut(() => TeacherExplanationController());
    // Get.lazyPut(() => FirstsController());
    // Get.lazyPut(() => NotificationContactController());
    // Get.lazyPut(() => ContactController(), fenix: true);
    // Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
