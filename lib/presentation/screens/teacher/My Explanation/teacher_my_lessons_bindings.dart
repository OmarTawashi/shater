import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/subject%20teacher/controller/subject_techer_controller.dart';

import 'teacher_my_lessons_controller.dart';

class TeacherMyLessonsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherMyLessonsController());
  }

}