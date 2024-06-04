import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/course_learning_model.dart';
import 'package:shater/data/repository/course_learning_repository_remote.dart';
import 'package:shater/domain/usecase/course_learning_usecase_imp.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';

class ExerciseController extends BaseController {
  CoursesLearningUseCaseImp? _CoursesLearningUseCaseImp;

  List<CourseLearningModel> _courseLearningModel = [];
  List<CourseLearningModel> get courseLearningModel => _courseLearningModel;

  @override
  void onInit() {
    super.onInit();
    _CoursesLearningUseCaseImp =
        CoursesLearningUseCaseImp(CoursesLearningRepositoryRemote(ApiClient()));
    // fetchCourseLearning();
  }
}
