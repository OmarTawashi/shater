import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/teacher/controller/teacher_controller.dart';

enum TeacherDetailsTap { Teacher, Subscription }

class TeacherDetailsController extends GetxController {
  TeacherDetailsTap _teacherTapSelected = TeacherDetailsTap.Subscription;
  TeacherDetailsTap get teacherTapSelected => _teacherTapSelected;

  TeacherController? teacherController;

  void changeTeacherTap(TeacherDetailsTap tap) {
    _teacherTapSelected = tap;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    teacherController = Get.find<TeacherController>();
  }
}
