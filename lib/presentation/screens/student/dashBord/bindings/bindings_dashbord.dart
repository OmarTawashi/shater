import 'package:get/get.dart';

import '../../contact/controller/contact_controller.dart';
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
    Get.lazyPut(() => ContactController());
  }
}
