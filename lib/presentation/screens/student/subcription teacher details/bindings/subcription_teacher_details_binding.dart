import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/subcription%20teacher%20details/controller/subcription_teacher_details_controller.dart';

class SubcriptionTeacherDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubcriptionTeacherDetailsController());
  }
}
