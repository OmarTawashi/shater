

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/teacher_model.dart';

abstract class TeacherRepository {
   Future<Either<ApiException, List<TeacherModel>>?> fetchTeachers(int? subjectId);

}