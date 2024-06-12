import 'package:get/get.dart';
import 'package:shater/presentation/screens/teacher/Teacher%20Pages%20Explained%20/teacher_pages_lessons_controller.dart';


class TeacherPagesLessonsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherPagesLessonsController());
  }

}