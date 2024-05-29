import 'dart:convert';
import 'dart:ui' as ui;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/base/image_converter.dart';

import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/data/model/arthimitic_object.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/api_constant.dart';
import 'package:shater/util/images.dart';
import 'package:signature/signature.dart';

import '../../../../../../data/model/typing_answer.dart';

enum FailureEnum { showExpalin, trueAnswer, stable }

class QuestionController extends GetxController {
  AudioPlayer audioPlayer = AudioPlayer();
  List<QuestionPageModel> _questionsPages = [];
  List<QuestionPageModel> get questionsPages => _questionsPages;

  List<dynamic> oldListOrderImage = [];
  List<dynamic> newListOrderImage = [];
  List<int> orderImageIndex = [];

  void setOrderImage(int data, int newIndex, int ImageIndexCorrect) {
    if (ImageIndexCorrect == newIndex || ImageIndexCorrect == -2) {
      newListOrderImage[newIndex] = oldListOrderImage[data];
      oldListOrderImage[data] = "null";
      setQuestionStatus(QuestionStatusEnum.select);
    } else if (ImageIndexCorrect == -1) {
      newListOrderImage[newIndex] = "null";
      oldListOrderImage[data] = "null";
      BaseMixin.showToastFlutter(messsage: 'this_not_contain_of_list');
    } else {
      BaseMixin.showToastFlutter(messsage: 'please_drag_in_correct_index');
    }
    update();
  }

  List<dynamic> oldListOrderText = [];
  List<dynamic> newListOrderText = [];
  List<int> orderTextIndex = [];

  void setOrderText(int data, int newIndex, int ImageIndexCorrect) {
    if (ImageIndexCorrect == newIndex || ImageIndexCorrect == -2) {
      newListOrderText[newIndex] = oldListOrderText[data];
      oldListOrderText[data] = "null";
      setQuestionStatus(QuestionStatusEnum.select);
    } else if (ImageIndexCorrect == -1) {
      newListOrderText[newIndex] = "null";
      oldListOrderText[data] = "null";

      BaseMixin.showToastFlutter(messsage: 'this_not_contain_of_list');
    } else {
      BaseMixin.showToastFlutter(messsage: 'please_drag_in_correct_index');
    }
    update();
  }

  void getOldListOrderImage() {
    oldListOrderImage = [];
    newListOrderImage = [];
    orderImageIndex = [];
    final orderBy = _questionModel?.orderBy as List;
    for (var i = 0; i < orderBy.length; i++) {
      final image = orderBy[i] as Map<String, dynamic>;
      final imageIndex = image.values.first;
      if (imageIndex is String) {
        final imageIndexConv = int.tryParse(imageIndex);
        if ((imageIndexConv ?? -1) > 0) {
          int imageIndexPL = (imageIndexConv ?? -2) - 1;
          orderImageIndex.add(imageIndexPL);
        } else if (imageIndexConv == 0) {
          orderImageIndex.add(-2);
        } else {
          orderImageIndex.add(imageIndexConv ?? 0);
        }
      } else {
        if (imageIndex > 0) {
          final imageIndexPL = imageIndex - 1;
          orderImageIndex.add(imageIndexPL);
        } else if (imageIndex == 0) {
          orderImageIndex.add(-2);
        } else {
          orderImageIndex.add(imageIndex);
        }
      }
      final imageUrl = image.keys.first;
      oldListOrderImage.add(imageUrl);
      newListOrderImage.add('null');
    }
  }

  void getOldListOrderText() {
    oldListOrderText = [];
    newListOrderText = [];
    orderTextIndex = [];
    final orderBy = _questionModel?.orderBy as List;
    for (var i = 0; i < orderBy.length; i++) {
      final image = orderBy[i] as Map<String, dynamic>;
      final imageIndex = image.values.first;
      if (imageIndex is String) {
        final imageIndexConv = int.tryParse(imageIndex);
        if ((imageIndexConv ?? -1) > 0) {
          int imageIndexPL = (imageIndexConv ?? -2) - 1;
          orderTextIndex.add(imageIndexPL);
        } else if (imageIndexConv == 0) {
          orderTextIndex.add(-2);
        } else {
          orderTextIndex.add(imageIndexConv ?? 0);
        }
      } else {
        if (imageIndex > 0) {
          final imageIndexPL = imageIndex - 1;
          orderTextIndex.add(imageIndexPL);
        } else if (imageIndex == 0) {
          orderTextIndex.add(-2);
        } else {
          orderTextIndex.add(imageIndex);
        }
      }
      final imageUrl = image.keys.first;
      oldListOrderText.add(imageUrl);
      newListOrderText.add('null');
    }
  }

  FailureEnum _failureTap = FailureEnum.stable;
  FailureEnum get failureTap => _failureTap;

  SignatureController? signatureWriteController;
  ui.Image? _signatureWritingImage;
  String? _writingBoardText;
  Future<void> performTextRecognition() async {
    try {
      _signatureWritingImage = await signatureWriteController?.toImage();
      final imageBytes =
          await ImageConverter.convertUiImageToBytes(_signatureWritingImage!);
      final imageFile =
          await ImageConverter.writeBytesToFile(imageBytes!, 'WritingBoard');
      final inputImage = InputImage.fromFile(imageFile);
      TextRecognizer _textRecognizer = TextRecognizer();
      final recognizedText = await _textRecognizer.processImage(inputImage);
      _writingBoardText = recognizedText.text;
      print(_writingBoardText);
      update();
      _textRecognizer.close();
    } catch (e) {
      print('Error during text recognition: $e');
    }
  }

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

  bool? _selectAnswerTrueFalse;
  bool? get selectAnswerTrueFalse => _selectAnswerTrueFalse;

  // List<TypingAnswer> _typingAnswer = [];
  // List<TypingAnswer> get typingAnswer => _typingAnswer;

  List<QuestionModel> _questionsAnswer = [];
  List<QuestionModel> get questionsAnswer => _questionsAnswer;

  List<TypingAnswer> _answerQuestion = [];
  List<TypingAnswer> get answerQuestion => _answerQuestion;

  List _selectAnswer = [];
  List get selectAnswer => _selectAnswer;

  QuestionStatusEnum _questionStatus = QuestionStatusEnum.none;
  QuestionStatusEnum get questionStatus => _questionStatus;

  @override
  void onInit() {
    super.onInit();
    if (Get.previousRoute == Routes.getPageSubjectScreen()) {
      _questionsPages = Get.find<PageSubjectController>().questionSubject;
      // getQuestionPage();
      getAllQuestion();
    }
  }

  void setQuestion(QuestionModel? questionModel) {
    _questionModel = questionModel;
    update();
  }

  void setAnswerTrueOrFalse(bool answer) {
    _selectAnswerTrueFalse = answer;
    setQuestionStatus(QuestionStatusEnum.select);
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

  void setInputControllerComperhensiveImage() {
    final answer = _questionModel?.answer ?? [];
    if (_inputComperhensiveImage.length < answer.length) {
      for (var i = 0; i < answer.length; i++) {
        if (answer[i] == 'space') {
          _inputComperhensiveImage.add(TypingAnswer(
              index: i, textEditingController: TextEditingController()));
        } else {
          _inputComperhensiveImage.add(null);
        }
      }
    }
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

  void setAnswer(dynamic answer, {int? index}) {
    setQuestionStatus(QuestionStatusEnum.select);
    final typingAnswer = TypingAnswer(index: index ?? -1, input: answer);
    if (_selectAnswer.contains(answer)) {
      // _answerQuestion.remove(typingAnswer);
      _selectAnswer.remove(answer);
    } else {
      // _selectAnswer.clear();
      // _selectAnswer.add(answer);
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
    playAudioUrl(questionModel?.titleAudio ?? '');
    if (questionType?.qtype == QType.ComprehensiveImage) {
      _inputComperhensiveImage = [];
      if (_questionModel?.answer?.contains('<skip>') == true) {
        setQuestionStatus(QuestionStatusEnum.skip);
      }
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
    switch (questionType?.qtype) {
      case QType.CompleteValue:
        final answerValue = completeValueController.text.trim();
        valid = _questionModel?.valid ?? [];
        checked = valid.contains(answerValue);
        break;
      case QType.OrderImage:
        final answerold = oldListOrderImage;
        checked = (answerold.every((item) => item == "null"));
        break;
      case QType.OrderWord:
        final answerold = oldListOrderText;
        checked = (answerold.every((item) => item == "null"));
        break;
      case QType.WritingBoard:
        performTextRecognition().then((value) {
          String? answer;
          String? valid;
          if (_writingBoardText != null) {
            answer = questionModel?.answer?.first.toString().trim();
            valid = _writingBoardText?.trim();
            checked = (answer == valid);
          }
        });
        break;
      case QType.TrueOrFalseImage:
        final answerValue = _selectAnswerTrueFalse.toString().toLowerCase();
        final validValue =
            _questionModel?.answer?.first.toString().toLowerCase();
        checked = (answerValue == validValue);
        break;
      case QType.ComprehensiveImage:
        for (int i = 0; i < _inputComperhensiveImage.length; i++) {
          if (_inputComperhensiveImage[i] == null) {
            _selectAnswer.add("null");
          } else {
            _selectAnswer
                .add(_inputComperhensiveImage[i]?.textEditingController?.text);
          }
        }
        valid = _questionModel?.valid ?? [];
        checked = listsAreEqual(valid, _selectAnswer);

        break;
      default:
        valid = _questionModel?.valid ?? [];
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

  void playAudioUrl(String? url) async {
    final fullUrl = ApiConstant.baseUrl + '/' + (url ?? '');
    print('Playing audio from: $fullUrl');
    audioPlayer.stop();
    try {
      await audioPlayer.play(
        UrlSource(fullUrl),
        volume: 1.0,
      );
      print('Audio started playing');
    } catch (e) {
      print('Error playing audio: $e');
    }
  }
}
