import 'package:fpdart/fpdart.dart';

import '../../data/model/user.dart';
import '../network/api_exceptions.dart';

abstract class BaseAuthRepository {
  Future<Either<ApiException, User>?> signInWithEmailPassword(
      String email, String password);
  Future<Either<ApiException, User>?> registerWithEmailPassword(
      String email,
      String password,
      String password_confirmation,
      int schoolId,
      String name,
      int countryId,
      int cityId);
}
