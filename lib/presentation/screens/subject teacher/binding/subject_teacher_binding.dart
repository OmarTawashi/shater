import 'package:get/get.dart';
import 'package:shater/presentation/screens/subject%20teacher/controller/subject_techer_controller.dart';

class SubjectTeacherBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SubjectTeacherController());
  }

}