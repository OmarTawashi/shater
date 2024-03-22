import 'package:get/get.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';

class QuestionController extends GetxController {
  List<QuestionPageModel> _questions = [];
  List<QuestionPageModel> get questions => _questions;

  QuestionPageModel? _questionPage;
  QuestionPageModel? get questionPage => _questionPage;

  @override
  void onInit() {
    super.onInit();
    _questions = Get.find<PageSubjectController>().questionSubject;
  }

  // void getQuestion(){
  //   _questionPageNo= 0;
  //   _questions.forEach((element) {
  //     if (_questionPage == null) {
  //       _questionPage = element;
  //     }else{}
  //   })
  // }
}
