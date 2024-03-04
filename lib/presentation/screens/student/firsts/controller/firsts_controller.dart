import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/repository/rate_student_repository_remote.dart';
import 'package:shater/domain/usecase/rate_student_useecase_imp.dart';

enum TabFirsts { studentToday, schoolToday }

class FirstsController extends BaseController {
  TabFirsts selectSection = TabFirsts.studentToday;

  RateStudentUseCaseImp? _rateStudentUseCaseImp;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _rateStudentUseCaseImp =
        RateStudentUseCaseImp(RateStudentRepositoryRemote(ApiClient()));
    getData(selectSection);
  }

  void changeSection(TabFirsts tabSection) {
    selectSection = tabSection;
    update();
  }

  void fetchStudentsRate() async {
    updateViewType(ViewType.shimmer);
    await _rateStudentUseCaseImp?.fetchStudentsRate().then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (r) {
        if (r == null) {
          updateViewType(ViewType.empty);
        } else {
          // _courseLearningModel = r;
          updateViewType(ViewType.success);
        }
      });

      update();
    });
  }

  void fetchSchoolsRate() async {
    updateViewType(ViewType.shimmer);
    await _rateStudentUseCaseImp?.fetchSchoolsRate().then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (r) {
        if (r == null) {
          updateViewType(ViewType.empty);
        } else {
          // _courseLearningModel = r;
          updateViewType(ViewType.success);
        }
      });

      update();
    });
  }

  void getData(TabFirsts tap) {
    switch (tap) {
      case TabFirsts.schoolToday:
        return fetchSchoolsRate();
      case TabFirsts.studentToday:
        return fetchStudentsRate();

      default:
        return fetchStudentsRate();
    }
  }
}
