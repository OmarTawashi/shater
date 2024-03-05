import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/rate_student_repository.dart';
import 'package:shater/core/usecase/rate_student_useecase.dart';
import 'package:shater/data/model/student_model.dart';
import 'package:shater/data/model/subject_model.dart';

class RateStudentUseCaseImp extends RateStudentUseCase {
  final RateStudentRepository _rateStudentRepository;

  RateStudentUseCaseImp(this._rateStudentRepository);

  @override
  Future<Either<ApiException, List<StudentModel>>?> fetchStudentsRate() {
   return _rateStudentRepository.fetchStudentsRate();
  }
  @override
  Future<Either<ApiException, List<Subject>>?> fetchSchoolsRate() {
   return _rateStudentRepository.fetchSchoolsRate();
  }

 
}