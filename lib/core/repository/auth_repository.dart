import 'package:fpdart/fpdart.dart';
import 'package:shater/data/model/empty_model.dart';

import '../../data/model/user.dart';
import '../network/api_exceptions.dart';

abstract class BaseAuthRepository {
  Future<Either<ApiException, User>?> signInWithEmailPassword(
      String email, String password);
  Future<Either<ApiException, User>?> registerStudent(
      String email,
      String password,
      String password_confirmation,
      int schoolId,
      String name,
      int countryId,
      int cityId,
      String classId
      );
  Future<Either<ApiException, User>?> registerTeacher(
      String email,
      String password,
      String password_confirmation,
      int schoolId,
      String name,
      String subjectName,
      int countryId,
      int cityId,
      String classId
      );
    Future<Either<ApiException, EmptyModel>?> checkEmail(String email);
    
}