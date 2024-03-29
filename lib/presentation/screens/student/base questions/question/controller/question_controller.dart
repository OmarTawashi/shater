import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';

enum FailureEnum { showExpalin, trueAnswer }

class QuestionController extends GetxController {
  List<QuestionPageModel> _questionsPages = [];
  List<QuestionPageModel> get questionsPages => _questionsPages;

  FailureEnum? _failureTap;
  FailureEnum? get failureTap => _failureTap;

  TextEditingController completeValueController = TextEditingController();

  int _timeNumber = 0;
  int get timeNumber => _timeNumber;

  bool _isAnswer = false;
  bool get isAnswer => _isAnswer;

  int _questionIndex = 0;
  int get questionIndex => _questionIndex;

  QuestionType? _questionType;
  QuestionType? get questionType => _questionType;

  List<QuestionModel>? _questionsGet = [];
  List<QuestionModel>? get questionsGet => _questionsGet;

  QuestionModel? _questionModel;
  QuestionModel? get questionModel => _questionModel;

  int _answerNumValid = 0;
  int get answerNumValid => _answerNumValid;

  // TypingAnswer? _typingAnswer;
  // TypingAnswer? get typingAnswer => _typingAnswer;

  List _selectAnswer = [];
  List get selectAnswer => _selectAnswer;

  QuestionStatusEnum _questionStatus = QuestionStatusEnum.none;
  QuestionStatusEnum get questionStatus => _questionStatus;

  @override
  void onInit() {
    super.onInit();
    _questionsPages = Get.find<PageSubjectController>().questionSubject;
    // getQuestionPage();
    getAllQuestion();
  }

  void setQuestion(QuestionModel? questionModel) {
    _questionModel = questionModel;
    update();
  }

  void changeAnswer(bool isAns) {
    _isAnswer = isAns;
    update();
  }

  void changeFailuerTap(FailureEnum failure) {
    _failureTap = failure;
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

  void setAnswer(dynamic answer) {
    setQuestionStatus(QuestionStatusEnum.select);
    if (questionType?.qtype == QType.TrueOrFalseImage) {
      _selectAnswer = [];
    }
    if (_selectAnswer.contains(answer)) {
      _selectAnswer.remove(answer);
    } else {
      // _selectAnswer.clear();
      _selectAnswer.add(answer);
    }
    update();
  }

  void getAllQuestion() {
    _questionsPages.forEach((page) {
      if (page.questions != null && page.questions!.isNotEmpty) {
        _questionsGet?.addAll(page.questions!.whereType<QuestionModel>());
      }
    });
    update();
    getType();
  }

  void getType() {
    setQuestion(_questionsGet?[questionIndex]);
    int? type = _questionsGet?[questionIndex].typeId;
    _questionType = QuestionType.fromString(type.toString());
    if (_questionType?.qtype != QType.MultiChoiceText ||
        _questionType?.qtype != QType.TrueOrFalseImage ||
        _questionType?.qtype != QType.MultiChoiceImage) {
      setQuestionStatus(QuestionStatusEnum.skip);
    }
    update();
  }

  void getSecandQuestion() {
    if (_questionsGet?.indexed.last.$1 == _questionIndex) {
      _questionIndex = 0;
    } else if (_questionsGet?.indexed.last.$1 != _questionIndex) {
      _questionIndex += 1;
    }
    _selectAnswer = [];
    setNumberTime(0);
    changeAnswer(false);
    getType();
    completeValueController.clear();

    if (_questionType?.qtype != QType.VideoSkip) {
      setQuestionStatus(QuestionStatusEnum.none);
    }

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
    List<dynamic> valid = [];
    if (questionType?.qtype == QType.CompleteValue) {
      setAnswer(completeValueController.text);
      valid = _questionModel?.answer ?? [];
    }
    if (questionType?.qtype == QType.TrueOrFalseImage) {
      valid = _questionModel?.answer ?? [];
    } else {
      valid = _questionModel?.valid ?? [];
    }
    final checked = listsAreEqual(valid, _selectAnswer);
    if (checked) {
      setQuestionStatus(QuestionStatusEnum.success);
      _answerNumValid += 1;
      _questionModel?.isValid = true;
    } else {
      setQuestionStatus(QuestionStatusEnum.failure);
      _questionModel?.isValid = false;
    }
    changeAnswer(true);
  }
}
