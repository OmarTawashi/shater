import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/rate_school_model.dart';
import 'package:shater/data/model/student_model.dart';

abstract class RateStudentUseCase {
Future<Either<ApiException, List<StudentModel>>?> fetchStudentsRate(); 
Future<Either<ApiException, List<SchoolRateModel>>?> fetchSchoolsRate(); 
}