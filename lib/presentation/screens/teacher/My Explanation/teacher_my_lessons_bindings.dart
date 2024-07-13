import 'package:get/get.dart';

import 'teacher_my_lessons_controller.dart';

class TeacherMyLessonsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherMyLessonsController());
  }

}