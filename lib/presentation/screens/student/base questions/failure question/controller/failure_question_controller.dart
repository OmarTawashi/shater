import 'package:get/get.dart';



class FailureQuestionController extends GetxController{
   List<String> _reasonFailed = [
    'answer_correct',
    'question_wrong',
    'all_answer_failed'
  ];
  List<String> get reasonFailed => _reasonFailed;

  int? _selectIndex;
  int? get selectIndex =>_selectIndex;


  void changeIndex(int index){
    _selectIndex = index;
    update();
  }
}