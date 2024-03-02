import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/course_learning_model.dart';
import 'package:shater/data/repository/course_learning_repository_remote.dart';
import 'package:shater/domain/usecase/course_learning_usecase_imp.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';

enum TabExercise { exercied, exerciedTeachers }

class ExerciseController extends BaseController {
  TabExercise selectExercise= TabExercise.exercied;

  CoursesLearningUseCaseImp? _CoursesLearningUseCaseImp;

  List<CourseLearningModel> _courseLearningModel = [];
  List<CourseLearningModel> get courseLearningModel =>_courseLearningModel;

  @override
  void onInit() {
    super.onInit();
    _CoursesLearningUseCaseImp = CoursesLearningUseCaseImp(CoursesLearningRepositoryRemote(ApiClient()));
    fetchCourseLearning();
  }
  void changeSection(TabExercise tabSection) {
    selectExercise = tabSection;
    update();
  }

    void fetchCourseLearning() async {
    final dashController = Get.find<DashBoardController>();
  
    updateViewType(ViewType.loading);
    await _CoursesLearningUseCaseImp?.fetchCourseLearning(dashController.level?.id ??-1).then((value) {
      value?.fold((l) {
        updateViewType(ViewType.error);
      }, (r) {
        if (r == null) {
          updateViewType(ViewType.empty);
        } else {
          updateViewType(ViewType.success);
          _courseLearningModel = r;
        }
      });

      update();
    });
  }
}