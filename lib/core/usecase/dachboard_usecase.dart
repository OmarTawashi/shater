import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/result_exam_model.dart';
import 'package:shater/data/model/subject_video_model.dart';

import '../../data/model/course_learning_model.dart';
import '../../data/model/subject_model.dart';

abstract class DashBoardUseCase {
  Future<Either<ApiException, List<Subject>>?> fetchSubject();

  Future<Either<ApiException, List<CourseLearningModel>>?>
      fetchTeacherCoursesLesson(int level);

  Future<Either<ApiException, List<CourseLearningModel>>?> teacherCoursesList(
      int level);
  Future<Either<ApiException, List<ResultExam>>?> fetchResultSubject();
}
