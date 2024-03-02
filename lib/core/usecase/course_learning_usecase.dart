import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/course_learning_model.dart';

abstract class CoursesLearningUseCase{
  Future<Either<ApiException, List<CourseLearningModel>>?> fetchCourseLearning(int level);
 
}