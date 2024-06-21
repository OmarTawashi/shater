import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/teacher_repository.dart';
import 'package:shater/core/usecase/teacher_usecase.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/subject_video_model.dart';
import 'package:shater/data/model/teacher_model.dart';
import 'package:shater/data/model/vedio_subject_teacher.dart';

class TeacherUseCaseImp extends TeacherUseCase {
  final TeacherRepository _teacherRepository;

  TeacherUseCaseImp(this._teacherRepository);

  @override
  Future<Either<ApiException, List<TeacherModel>>?> fetchTeachers(
      int? subjectId) {
    return _teacherRepository.fetchTeachers(subjectId);
  }

  @override
  Future<Either<ApiException, EmptyModel>?> sendTeacherRead(int? teacherID) {
    return _teacherRepository.sendTeacherRead(teacherID);
  }

  @override
  Future<Either<ApiException, List<SubjectVideo>>?> fetchVideoOfSubject(
      int? page, int? subjectId, int? userID, int? publishTo) {
    return _teacherRepository.fetchVideoOfSubject(
      page,
      subjectId,
      userID,
      publishTo,
    );
  }

  @override
  Future<Either<ApiException, List<SubjectVideo>>?> fetchVideoOfSubject2(
      {required int? subjectId,
      required int? userID,
      required int? publishTo}) {
    return _teacherRepository.fetchVideoOfSubject2(
      publishTo: publishTo!,
      subjectId: subjectId!,
      userID: userID!,
    );
  }
}
