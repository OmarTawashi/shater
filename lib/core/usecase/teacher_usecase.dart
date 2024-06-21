import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/subject_video_model.dart';
import 'package:shater/data/model/teacher_model.dart';

abstract class TeacherUseCase {
  Future<Either<ApiException, List<TeacherModel>>?> fetchTeachers(
      int? subjectId);
  Future<Either<ApiException, EmptyModel>?> sendTeacherRead(int? teacherID);
  Future<Either<ApiException, List<SubjectVideo>>?> fetchVideoOfSubject(
      int? page, int? subjectId, int? userID, int? publishTo);

  Future<Either<ApiException, List<SubjectVideo>>?> fetchVideoOfSubject2(
      {required int? subjectId, required int? userID, required int? publishTo});
}
