import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/teacher_repository.dart';
import 'package:shater/core/usecase/teacher_usecase.dart';
import 'package:shater/data/model/teacher_model.dart';

class TeacherUseCaseImp extends TeacherUseCase {
  final TeacherRepository _teacherRepository;

  TeacherUseCaseImp(this._teacherRepository);

  @override
  Future<Either<ApiException, List<TeacherModel>>?> fetchTeachers(int? subjectId) {
   return _teacherRepository.fetchTeachers(subjectId);
  }

  

 
}