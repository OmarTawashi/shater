import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/result_exam_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/profile_repository_remote.dart';
import 'package:shater/domain/usecase/profile_usecase_imp.dart';

class ProfileController extends BaseController {
  ProfileUseCaseImp? _profileUseCaseImp;

  User? _user;
  User? get user => _user;

  List<ResultExam> _resultExams = [];
  List<ResultExam> get resultExams => _resultExams;

  ResultExam? _resultExamSelected;
  ResultExam? get resultExamSelected => _resultExamSelected;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    _profileUseCaseImp =
        ProfileUseCaseImp(ProfileRepositoryRemote(ApiClient()));
    getProfile();
    fetchResultSubject();
  }

  void setLoad(bool isLoad) {
    _isLoading = isLoad;
    update();
  }

  void setResultExam(ResultExam resultExam) {
    _resultExamSelected = resultExam;
    update();
  }

  void getProfile() async {
    setLoad(true);
    await _profileUseCaseImp?.fetchProfile().then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        _user = r;
      });
      setLoad(false);

      update();
    });
  }

  void fetchResultSubject() async {
    setLoad(true);
    await _profileUseCaseImp?.fetchResultSubject().then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        _resultExams = r;
      });
      setLoad(false);
      update();
    });
  }
}
