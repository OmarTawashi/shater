import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/subject%20teacher/controller/subject_techer_controller.dart';
import 'package:shater/presentation/screens/teacher/practice/practice_controller.dart';


class PracticeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PracticeController());
  }

}