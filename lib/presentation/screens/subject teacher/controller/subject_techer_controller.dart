import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/subject_model.dart';
import 'package:shater/data/repository/dashboard_repository_remote.dart';
import 'package:shater/domain/usecase/dachboard_usercase_imp.dart';

class SubjectTeacherController  extends BaseController{
   DashBaoardUseCaseImp? _dashBaoardUseCaseImp;

  List<Subject> _subjects = [];
  List<Subject> get subjects => _subjects;

  @override
  void onInit() {
    super.onInit();
    _dashBaoardUseCaseImp =
        DashBaoardUseCaseImp(DashBoardRepositoryRemote(ApiClient()));
        fetchSubject();
  }

  void fetchSubject() async {
    updateViewType(ViewType.loading);
    await _dashBaoardUseCaseImp?.fetchSubject().then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (s) {
        if (s.isEmpty) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _subjects = s;
        }
      });
      update();
    });
  }
}