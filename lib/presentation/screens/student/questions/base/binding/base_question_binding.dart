import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/questions/base/controller/base_question_controller.dart';
import 'package:shater/presentation/screens/student/questions/lesson/controller/lesson_controller.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';

class BaseQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseQuestionController());
    Get.put(QuestionController());
    Get.put(LessonController());
  }
}
