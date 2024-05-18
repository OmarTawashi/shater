import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/core/usecase/dachboard_usecase.dart';
import 'package:shater/data/model/result_exam_model.dart';
import 'package:shater/data/repository/dashboard_repository_remote.dart';
import 'package:shater/domain/usecase/dachboard_usercase_imp.dart';

class ResultController extends BaseController {
  DashBaoardUseCaseImp? _dashBaoardUseCaseImp;

  List<ResultExam> _resultExams = [];
  List<ResultExam> get resultExams => _resultExams;

  ResultExam? _resultExamSelected;
  ResultExam? get resultExamSelected => _resultExamSelected;

  @override
  void onInit() {
    super.onInit();
    _dashBaoardUseCaseImp =
        DashBaoardUseCaseImp(DashBoardRepositoryRemote(ApiClient()));
    fetchResultSubject();
  }

  void setResultExam(ResultExam resultExam) {
    _resultExamSelected = resultExam;
    update();
  }

  void fetchResultSubject() async {
    updateViewType(ViewType.loading);
    await _dashBaoardUseCaseImp?.fetchResultSubject().then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        _resultExams = r;
        updateViewType(ViewType.success);
      });
      update();
    });
  }
}
