import 'package:get/get.dart';

enum BaseQuestionTap { question, lesson }

class BaseQuestionController extends GetxController {
  BaseQuestionTap _selectTap = BaseQuestionTap.question;
  BaseQuestionTap get selectTap => _selectTap;


  
@override
  void onInit() {
    super.onInit();

  }



  void changTap(BaseQuestionTap type) {
    _selectTap = type;
    update();
  }
}
