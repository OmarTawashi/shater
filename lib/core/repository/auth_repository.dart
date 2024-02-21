import 'package:fpdart/fpdart.dart';

import '../../data/model/user.dart';
import '../network/api_exceptions.dart';

abstract class BaseAuthRepository {
  Future<Either<ApiException, User>?> signInWithEmailPassword(
      String email, String password);
  Future<Either<Exception, User>?> registerWithEmailPassword(
      String email, String password);
}