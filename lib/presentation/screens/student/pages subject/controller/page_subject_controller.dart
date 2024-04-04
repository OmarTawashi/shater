import 'package:get/get.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/page_model.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/data/repository/question_repository_remote.dart';
import 'package:shater/domain/usecase/question_usecase_imp.dart';
import 'package:shater/presentation/screens/student/exercises/controller/exercise_controller.dart';
import 'package:shater/routes/app_routes.dart';

class PageSubjectController extends GetxController {
  QuestionUseCaseImp? _questionUseCaseImp;

  PageModel? _pageModel;
  PageModel? get pageModel => _pageModel;

  List<QuestionPageModel> _questionSubject = [];
  List<QuestionPageModel> get questionSubject => _questionSubject;

  int? _fromValue;
  int? get fromValue => _fromValue;

  int? _toValue;
  int? get toValue => _toValue;

  bool _isLoadingScreen = false;
  bool get isLoadingScreen => _isLoadingScreen;

  bool _isLoadingButton = false;
  bool get isLoadingButton => _isLoadingButton;

  @override
  void onInit() {
    super.onInit();
    _questionUseCaseImp =
        QuestionUseCaseImp(QuestionRepositoryRemote(ApiClient()));
    fetchQuestionPage();
  }

  void setFormValue(int value) {
    _fromValue = value;
    update();
  }

  void setToValue(int value) {
    _toValue = value;
    update();
  }

  void setLoad(bool isLoad) {
    _isLoadingScreen = isLoad;
    update();
  }

  void setLoadButton(bool isLoad) {
    _isLoadingButton = isLoad;
    update();
  }

  void fetchQuestionPage() async {
    setLoad(true);
    final subjectID = Get.find<ExerciseController>().selectedCourse?.id;
    await _questionUseCaseImp?.fetchQuestionPage(subjectID).then((value) {
      value?.fold((l) {}, (r) {
        _pageModel = r;
        setFormValue(r.fromPageNo ?? 0);
        setToValue(r.toPageNo ?? 0);
      });
      setLoad(false);

      update();
    });
  }

  void fetchQuestionSubject() async {
    setLoadButton(true);
    final subjectID = Get.find<ExerciseController>().selectedCourse?.id;
    await _questionUseCaseImp
        ?.fetchQuestionSubject(subjectID, _fromValue, _toValue)
        .then((value) {
      value?.fold((l) {}, (r) {
        _questionSubject = r;
        Get.toNamed(Routes.getBaseQuestionScreen());
      });
      setLoadButton(false);

      update();
    });
  }
}
