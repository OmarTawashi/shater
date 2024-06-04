import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/result%20subject/controller/result_subject_controller.dart';

class ResultSubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResultSubjectController());
  }
}
