import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/dashboard_repository.dart';
import 'package:shater/core/usecase/dachboard_usecase.dart';
import 'package:shater/data/model/course_learning_model.dart';
import 'package:shater/data/model/result_exam_model.dart';
import 'package:shater/data/model/subject_model.dart';

class DashBaoardUseCaseImp extends DashBoardUseCase {
  final DashBoardRepository _dashBoardRepository;

  DashBaoardUseCaseImp(this._dashBoardRepository);

  @override
  Future<Either<ApiException, List<Subject>>?> fetchSubject() {
    return _dashBoardRepository.fetchSubject();
  }

  @override
  Future<Either<ApiException, List<CourseLearningModel>>?>
      fetchTeacherCoursesLesson(int level) {
    return _dashBoardRepository.fetchTeacherCoursesLesson(level);
  }

  @override
  Future<Either<ApiException, List<CourseLearningModel>>?> teacherCoursesList(
      int level) {
    // TODO: implement teacherCoursesList
    return _dashBoardRepository.teacherCoursesList(level);
  }

  @override
  Future<Either<ApiException, List<ResultExam>>?> fetchResultSubject() {
    return _dashBoardRepository.fetchResultSubject();
  }
  
}
