import 'package:fpdart/fpdart.dart';

import '../../data/model/user.dart';
import '../network/api_exceptions.dart';

abstract class AuthUseCase {
  Future<Either<ApiException, User>?> signInWithEmailPassword(
      String email, String password);
  Future<Either<Exception, User>?> registerWithEmailPassword(
       String email,
      String password,
      String passwordConfirmation,
      int schoolId,
      String name,
      int countryId,
      int cityId);
  Future<void> signOut();
}