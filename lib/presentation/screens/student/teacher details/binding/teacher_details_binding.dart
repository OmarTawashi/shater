import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/teacher%20details/controller/teacher_details_controller.dart';

class TeacherDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeacherDetailsController());
  }
}
