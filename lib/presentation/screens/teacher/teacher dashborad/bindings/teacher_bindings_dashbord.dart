import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/contact/controller/contact_controller.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/controller/notification_contact_controller.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/notification/controller/notification_controller.dart';

import '../../../student/exercises/controller/exercise_controller.dart';
import '../../../student/firsts/controller/firsts_controller.dart';
import '../../../student/subject/controller/subjects_controller.dart';
import '../../../student/teacher/controller/teacher_controller.dart';
import '../controller/teacher_dashboard_controller.dart';


class TeacherDashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherDashBoardController>(() => TeacherDashBoardController());
    Get.lazyPut(() => SubjectController());
    Get.lazyPut(() => ExerciseController());
    Get.lazyPut(() => TeacherController());
    Get.lazyPut(() => FirstsController());
    Get.lazyPut(() => NotificationContactController());
    Get.lazyPut(() => ContactController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
