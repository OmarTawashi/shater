import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/user.dart';

abstract class ProfileUseCase {
  Future<Either<ApiException, User>?> fetchProfile();
  Future<Either<ApiException, EmptyModel>?> shareExam(exam);
}
