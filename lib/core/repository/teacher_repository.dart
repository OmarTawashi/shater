import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/SubjectPagesModel.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/data/model/specific_page_exercises_model.dart';
import 'package:shater/data/model/subject_video_model.dart';
import 'package:shater/data/model/teacher_model.dart';

abstract class TeacherRepository {
  Future<Either<ApiException, List<TeacherModel>>?> fetchTeachers(
      int? subjectId);
  Future<Either<ApiException, EmptyModel>?> sendTeacherRead(int? teacherID);
  Future<Either<ApiException, List<SubjectVideo>>?> fetchVideoOfSubject(
      int? page, int? subjectId, int? userID, int? publishTo);
  Future<Either<ApiException, List<SubjectVideo>>?> fetchVideoOfSubject2({
    required int publishTo,
    required int subjectId,
    required int userID,
  });
  Future<Either<ApiException, SubjectPagesModel>?>
      getTeacherCoursesExercisesList({
    required int course_id,
  });

  Future<Either<ApiException, QuestionPageModel>?>
      getSpecificPageExercisesList({
    required int subject_id,
    required int pageFrom,
    required int pageTo,
  });
}
