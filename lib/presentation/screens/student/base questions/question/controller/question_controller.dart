import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/data/model/typing_answer.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';

class QuestionController extends GetxController {
 

  List<QuestionPageModel> _questions = [];
  List<QuestionPageModel> get questions => _questions;

  QuestionPageModel? _questionPage;
  QuestionPageModel? get questionPage => _questionPage;

  int _timeNumber = 0;
  int get timeNumber => _timeNumber;

  bool _isAnswer = false;
  bool get isAnswer => _isAnswer;

  int _questionNo = 0;
  int get questionNo => _questionNo;

  int _questionIndex = 0;
  int get questionIndex => _questionIndex;

  QuestionType? _questionType;
  QuestionType? get questionType => _questionType;

  QuestionModel? _questionModel;
  QuestionModel? get questionModel => _questionModel;

  int _answerNumValid = 0;
  int get answerNumValid => _answerNumValid;

  TypingAnswer? _typingAnswer;
  TypingAnswer? get typingAnswer => _typingAnswer;

  List _selectAnswer = [];
  List get selectAnswer => _selectAnswer;

  int? _selectIndex;
  int? get selectIndex => _selectIndex;

  QuestionStatusEnum _questionStatus = QuestionStatusEnum.none;
  QuestionStatusEnum get questionStatus => _questionStatus;

  @override
  void onInit() {
    super.onInit();
    _questions = Get.find<PageSubjectController>().questionSubject;
    getQuestionPage();
  }

  void setQuestionNo(int number) {
    _questionNo = number;
    update();
  }

  void setQuestion(QuestionModel? questionModel) {
    _questionModel = questionModel;
    update();
  }

  void changeAnswer(bool isAns) {
    _isAnswer = isAns;
    update();
  }

  void setNumberTime(int number) {
    _timeNumber = number;
    update();
  }

  void setQuestionStatus(QuestionStatusEnum status) {
    _questionStatus = status;
    update();
  }

  void setQuestionIndex(int number) {
    _questionIndex = number;
    update();
  }

  void setSelectIndex(int? index) {
    _selectIndex = index;
    setQuestionStatus(QuestionStatusEnum.select);
    update();
  }

  void setAnswer(dynamic answer) {
    if (questionType?.qtype == QType.TrueOrFalseImage) {
      _selectAnswer = [];
    }
    if (_selectAnswer.contains(answer)) {
      _selectAnswer.remove(answer);
    } else {
      _selectAnswer.add(answer);
    }
    update();
  }

  void getQuestionPage() {
    _questionPage = _questions[_questionNo];
    setQuestion(_questionPage?.questions?[_questionIndex]);
    getType();
    update();
  }

  void getType() {
    int? type = _questionPage?.questions?[questionIndex]?.typeId;
    _questionType = QuestionType.fromString(type.toString() ?? '');
    if (_questionType?.qtype == QType.VideoSkip) {
      setQuestionStatus(QuestionStatusEnum.skip);
    }
    update();
  }

  void getSecandQuestion() {
    if (_questions.indexed.last.$1 != _questionNo) {
      if (_questionPage?.questions?.indexed.last.$1 == _questionIndex) {
        _questionNo += 1;
        _questionIndex = 0;
      } else if (_questionPage?.questions?.indexed.last.$1 != _questionIndex) {
        _questionIndex += 1;
      }
      _selectAnswer = [];
      setNumberTime(0);
      changeAnswer(false);
      setSelectIndex(null);
      getQuestionPage();
    } else {
      print('Finish Question of subject');
    }
    setQuestionStatus(QuestionStatusEnum.none);

    update();
  }

  bool listsAreEqual(List<dynamic> list1, List<dynamic> list2) {
    if (list1.length != list2.length) {
      return false;
    }

    list1.sort();
    list2.sort();

    for (int i = 0; i < list1.length; i++) {
      if (list1[i] != list2[i]) {
        return false;
      }
    }

    return true;
  }

  void checkAnswer() {
    final valid = questionPage?.questions?[questionIndex]?.valid ?? [];

    final checked = listsAreEqual(valid, _selectAnswer);
    if (checked) {
      setQuestionStatus(QuestionStatusEnum.success);
      _answerNumValid += 1;
    } else {
      setQuestionStatus(QuestionStatusEnum.failure);
    }
    changeAnswer(true);
  }
}
