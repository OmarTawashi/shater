import 'package:get/get.dart';

import '../controller/exercise_subject_controller.dart';

class ExerciseSubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExerciseSubjectController>(() => ExerciseSubjectController());
  }
}
