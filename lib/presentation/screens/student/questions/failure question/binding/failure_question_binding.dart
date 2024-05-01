import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/questions/failure%20question/controller/failure_question_controller.dart';

class FailureQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FailureQuestionController());
  }
}
