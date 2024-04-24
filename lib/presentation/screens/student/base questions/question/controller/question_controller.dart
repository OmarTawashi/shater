import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/data/model/arthimitic_object.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/images.dart';

import '../../../../../../data/model/typing_answer.dart';

enum FailureEnum { showExpalin, trueAnswer, stable }

class QuestionController extends GetxController {
  List<QuestionPageModel> _questionsPages = [];
  List<QuestionPageModel> get questionsPages => _questionsPages;

  FailureEnum _failureTap = FailureEnum.stable;
  FailureEnum get failureTap => _failureTap;

  TextEditingController completeValueController = TextEditingController();

  List<TypingAnswer?> _inputComperhensiveImage = [];
  List<TypingAnswer?> get inputComperhensiveImage => _inputComperhensiveImage;

  int _timeNumber = 0;
  int get timeNumber => _timeNumber;

  String? _congrlateText;
  String? get congrlateText => _congrlateText;

  String? _comprehensiveKey;
  String? get comprehensiveKey => _comprehensiveKey;

  bool _isAnswer = false;
  bool get isAnswer => _isAnswer;

  int _questionIndex = 0;
  int get questionIndex => _questionIndex;

  int _arithmiticIndex = 0;
  int get arithmiticIndex => _arithmiticIndex;

  QuestionType? _questionType;
  QuestionType? get questionType => _questionType;

  ArithmeticTextModel? _arithmeticTextModel;
  ArithmeticTextModel? get arithmeticTextModel => _arithmeticTextModel;

  List<QuestionModel>? _questionsGet = [];
  List<QuestionModel>? get questionsGet => _questionsGet;

  QuestionModel? _questionModel;
  QuestionModel? get questionModel => _questionModel;

  int _answerNumValid = 0;
  int get answerNumValid => _answerNumValid;

  // List<TypingAnswer> _typingAnswer = [];
  // List<TypingAnswer> get typingAnswer => _typingAnswer;

  List<QuestionModel> _questionsAnswer = [];
  List<QuestionModel> get questionsAnswer => _questionsAnswer;

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

  void getObjetArithmitic() {
    final str = _questionModel?.answer?.first;
    Map<String, dynamic> obj = jsonDecode(str);
    _arithmeticTextModel = ArithmeticTextModel.fromJson(obj);
  }

  void setIndexArithmitic(int index) {
    _arithmiticIndex = index;
  }

  void setInputControllerComperhensiveImage(int index) {
    final lenghtCheck = _questionModel?.answer?.length ?? 0;
    _questionModel?.answer?.forEach((element) {
      if (lenghtCheck > _inputComperhensiveImage.length) {
        if (element == 'space') {
          _inputComperhensiveImage.add(TypingAnswer(
              index: index, textEditingController: TextEditingController()));
        } else {
          _inputComperhensiveImage.add(null);
        }
      }
    });
  }

  void changeInputValueComperhensiveImage(String value, int index) {
    setQuestionStatus(QuestionStatusEnum.select);
    final indexCheck = _inputComperhensiveImage.firstWhere(
      (element) => element?.index == index,
    );
    indexCheck?.input = indexCheck.textEditingController?.text;
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

  void setQuestionAnswer(QuestionModel? question) {
    if (_questionsAnswer.contains(question)) {
      _selectAnswer.remove(question);
    } else {
      _selectAnswer.add(question);
    }
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
    if (_questionsGet?[questionIndex].id != questionModel?.id) {
      setQuestion(_questionsGet?[questionIndex]);
    }
    int? type = _questionsGet?[questionIndex].typeId;
    _questionType = QuestionType.fromString(type.toString());
    if (_questionType?.qtype != QType.MultiChoiceText ||
        _questionType?.qtype != QType.TrueOrFalseImage ||
        _questionType?.qtype != QType.MultiChoiceImage) {
      setQuestionStatus(QuestionStatusEnum.skip);
    }
    update();
  }

  void getAnswerSuccss() {
    _selectAnswer = [];
    if (questionType?.qtype == QType.CompleteValue) {
      setAnswer(completeValueController.text);
      _selectAnswer = _questionModel?.answer ?? [];
    } else if (questionType?.qtype == QType.TrueOrFalseImage) {
      _selectAnswer = _questionModel?.answer ?? [];
    } else {
      _selectAnswer = _questionModel?.valid ?? [];
    }
    setQuestionStatus(QuestionStatusEnum.success);

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
    changeFailuerTap(FailureEnum.stable);
    setQuestionStatus(QuestionStatusEnum.none);
    if (questionType?.qtype == QType.ComprehensiveImage) {
      _inputComperhensiveImage = [];
      if (_questionModel?.answer?.contains('<skip>') == true) {
        setQuestionStatus(QuestionStatusEnum.skip);
      }
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
    bool checked = false;
    if (questionType?.qtype == QType.CompleteValue) {
      setAnswer(completeValueController.text);
      valid = _questionModel?.answer ?? [];
    } else if (questionType?.qtype == QType.TrueOrFalseImage) {
      valid = _questionModel?.answer ?? [];
    } else if (questionType?.qtype == QType.ComprehensiveImage) {
      for (int i = 0; i < _inputComperhensiveImage.length; i++) {
        if (_inputComperhensiveImage[i] == null) {
          _selectAnswer.add("null");
        } else {
          _selectAnswer
              .add(_inputComperhensiveImage[i]?.textEditingController?.text);
        }
      }
      valid = _questionModel?.valid ?? [];
    } else {
      valid = _questionModel?.valid ?? [];
    }
    if (questionType?.qtype == QType.ComprehensiveImage) {
      checked = (valid.length == _selectAnswer.length &&
          _selectAnswer.every((element) => valid.contains(element)));
    } else {
      checked = listsAreEqual(valid, _selectAnswer);
    }

    if (checked) {
      setQuestionStatus(QuestionStatusEnum.success);
      _answerNumValid += 1;
      _questionModel?.isValid = true;
    } else {
      setQuestionStatus(QuestionStatusEnum.failure);
      _answerNumValid = 0;
      _questionModel?.isValid = false;
    }
    changeAnswer(true);
    setQuestionAnswer(questionModel);
    showCongrlate();
  }

  void showCongrlate() {
    switch (_answerNumValid) {
      case 5:
        _congrlateText = VIDEO.answer5;
        Get.toNamed(Routes.getCongrlateScreen());
        break;
      case 10:
        _congrlateText = VIDEO.answer10;
        Get.toNamed(Routes.getCongrlateScreen());
        break;

      case 20:
        _congrlateText = VIDEO.answer20;
        Get.toNamed(Routes.getCongrlateScreen());
        break;
    }
  }
}
