import 'package:get/get.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';

class QuestionController extends GetxController {
  List<QuestionPageModel> _questions =
      Get.find<PageSubjectController>().questionSubject;
  List<QuestionPageModel> get questions => _questions;
}
