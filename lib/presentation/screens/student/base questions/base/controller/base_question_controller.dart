import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';

enum BaseQuestionTap { question, lesson }

class BaseQuestionController extends GetxController {
  BaseQuestionTap _selectTap = BaseQuestionTap.question;
  BaseQuestionTap get selectTap => _selectTap;


  int? _countQuestions ;
  int? get countQuestions => _countQuestions;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _countQuestions = Get.find<PageSubjectController>().questionSubject.first.countQuestions ?? 0;

  }



  void changTap(BaseQuestionTap type) {
    _selectTap = type;
    update();
  }
}
