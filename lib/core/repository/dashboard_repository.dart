import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/subject_model.dart';

import '../../data/model/course_learning_model.dart';

abstract class DashBoardRepository {
   Future<Either<ApiException, List<Subject>>?> fetchSubject();

   Future<Either<ApiException, List<CourseLearningModel>>?> fetchTeacherCoursesLesson(int level);

   Future<Either<ApiException, List<CourseLearningModel>>?> teacherCoursesList(int level) ;

   }