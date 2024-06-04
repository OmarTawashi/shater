import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/course_learning_model.dart';
import 'package:shater/data/repository/course_learning_repository_remote.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';
import 'package:shater/presentation/screens/student/subject/widgets/shimmer_subject.dart';

import '../../../../../domain/usecase/course_learning_usecase_imp.dart';

enum SubjectTap { lessons, execise }

class SubjectController extends BaseController {
  CoursesLearningUseCaseImp? _CoursesLearningUseCaseImp;

  List<CourseLearningModel> _courseLearningModel = [];
  List<CourseLearningModel> get courseLearningModel => _courseLearningModel;

  SubjectTap _subjectTapSelected = SubjectTap.lessons;
  SubjectTap get subjectTapSelected => _subjectTapSelected;

  CourseLearningModel? _selectedCourse;
  CourseLearningModel? get selectedCourse => _selectedCourse;

  @override
  void onInit() {
    super.onInit();
    _CoursesLearningUseCaseImp =
        CoursesLearningUseCaseImp(CoursesLearningRepositoryRemote(ApiClient()));
    getData(_subjectTapSelected);
  }

  void setCourse(CourseLearningModel course) {
    _selectedCourse = course;
    update();
  }

  void changeTap(SubjectTap subTap) {
    _subjectTapSelected = subTap;
    update();
  }

  void getData(SubjectTap tap) {
    switch (tap) {
      case SubjectTap.lessons:
        return fetchCourseLearning();
      case SubjectTap.execise:
        return fetchCourseLearning();

      default:
        return fetchCourseLearning();
    }
  }

  void fetchCourseLearning() async {
    final dashController = Get.find<DashBoardController>();
    updateViewType(ViewType.shimmer);
    await _CoursesLearningUseCaseImp?.fetchCourseLearning(
            dashController.level?.id ?? -1)
        .then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        if (r == null) {
          updateViewType(ViewType.empty);
        } else {
          _courseLearningModel = r;
          updateViewType(ViewType.success);
        }
      });

      update();
    });
  }
}
