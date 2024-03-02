import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/subject_model.dart';

abstract class CoursesLearningUseCase{
  Future<Either<ApiException, Subject>?> fetchCourseLearning(int level);
 
}