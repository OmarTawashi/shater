import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';

enum BaseQuestionTap { question, lesson }

class BaseQuestionController extends GetxController {
  BaseQuestionTap _selectTap = BaseQuestionTap.question;
  BaseQuestionTap get selectTap => _selectTap;


  int? _countQuestions ;
  int? get countQuestions => _countQuestions;

@override
  void onInit() {
    super.onInit();
    _countQuestions = Get.find<QuestionController>().questionPage?.countQuestions;

  }



  void changTap(BaseQuestionTap type) {
    _selectTap = type;
    update();
  }
}
