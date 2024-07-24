import 'package:get/get.dart';
import 'package:shater/presentation/screens/teacher/Teacher%20Pages%20Explained/teacher_pages_lessons_controller.dart';
import 'package:shater/presentation/screens/teacher/subscription/subscribers_controller.dart';

import '../../../student/dashBord/controller/dashboard_controller.dart';
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
    Get.lazyPut(() => SubscribersController());
    Get.lazyPut(() => TeacherPagesLessonsController());
    // Get.lazyPut(() => NotificationContactController());
    // Get.lazyPut(() => ContactController(), fenix: true);
    // Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
