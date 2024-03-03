import 'package:fpdart/fpdart.dart';
import 'package:shater/data/model/empty_model.dart';

import '../../data/model/user.dart';
import '../network/api_exceptions.dart';

abstract class BaseAuthRepository {
  Future<Either<ApiException, User>?> signInWithEmailPassword(
      String email, String password);
  Future<Either<Exception, User>?> registerStudent(
    String email,
    String password,
    String passwordConfirmation,
    int schoolId,
    String name,
    int countryId,
    int cityId,
    String classId,
  );
  Future<Either<Exception, User>?> registerTeacher(
      String email,
      String password,
      String passwordConfirmation,
      int schoolId,
      String name,
      String subjectName,
      int countryId,
      int cityId,
      String classIDS);

  Future<Either<ApiException, EmptyModel>?> checkEmail(String email);

  Future<Either<ApiException, EmptyModel>?> ForgetPassword(String email);
}
