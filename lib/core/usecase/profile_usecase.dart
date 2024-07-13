import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/result_exam_model.dart';
import 'package:shater/data/model/user.dart';

abstract class ProfileUseCase {
  Future<Either<ApiException, User>?> fetchProfile(String token,{bool isTeacher = false});
  Future<Either<ApiException, EmptyModel>?> shareExam(exam);
}
