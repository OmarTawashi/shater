import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/contact/controller/contact_controller.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/controller/notification_contact_controller.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/notification/controller/notification_controller.dart';

import '../../exercises/controller/exercise_controller.dart';
import '../../firsts/controller/firsts_controller.dart';
import '../../subject/controller/subjects_controller.dart';
import '../../teacher/controller/teacher_controller.dart';
import '../controller/dashboard_controller.dart';

class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut(() => SubjectController());
    Get.lazyPut(() => ExerciseController());
    Get.lazyPut(() => TeacherController());
    Get.lazyPut(() => FirstsController());
    Get.lazyPut(() => NotificationContactController());
    Get.lazyPut(() => ContactController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
  }
}
