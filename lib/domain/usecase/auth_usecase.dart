import 'package:fpdart/fpdart.dart';
import 'package:shater/core/data/repository/auth_repository.dart';

import '../../../model/user.dart';

abstract class AuthUseCase {
  Future<Either<Exception, User>?> signInWithEmailPassword(
      String email, String password);
  Future<Either<Exception, User>?> registerWithEmailPassword(
      String email, String password);
  Future<void> signOut();
}

class AuthUseCaseImp extends AuthUseCase {
  final BaseAuthRepository _authRepository;

  AuthUseCaseImp(this._authRepository);

  @override
  Future<Either<Exception, User>?> signInWithEmailPassword(
      String email, String password) {
    return _authRepository.signInWithEmailPassword(email, password);
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, User>?> registerWithEmailPassword(
      String email, String password) {
     return _authRepository.registerWithEmailPassword(email, password);
  }
}
