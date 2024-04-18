import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/subject%20teacher/controller/subject_techer_controller.dart';
import 'package:shater/presentation/screens/teacher/Explanation/teacher_explanation_controller.dart';


class TeacherExplanationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherExplanationController());
  }

}