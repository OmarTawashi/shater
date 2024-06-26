import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/course_learning_repository.dart';
import 'package:shater/data/model/course_learning_model.dart';

class CoursesLearningUseCaseImp extends CoursesLearningRepository {
  final CoursesLearningRepository _CoursesLearningRepository;

  CoursesLearningUseCaseImp(this._CoursesLearningRepository);

  @override
  Future<Either<ApiException, List<CourseLearningModel>>?> fetchCourseLearning(int level) {
    return _CoursesLearningRepository.fetchCourseLearning(level);
  }
}
