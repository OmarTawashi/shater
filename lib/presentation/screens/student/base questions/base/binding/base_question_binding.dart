import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/controller/base_question_controller.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';

class BaseQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(QuestionController());
    Get.put(BaseQuestionController());
  }
}
