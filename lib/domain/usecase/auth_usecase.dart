import 'package:fpdart/fpdart.dart';
import 'package:shater/data/repository/auth_repository.dart';
import 'package:shater/domain/network/api_exceptions.dart';

import '../../data/model/user.dart';

abstract class AuthUseCase {
  Future<Either<ApiException, User>?> signInWithEmailPassword(
      String email, String password);
  Future<Either<Exception, User>?> registerWithEmailPassword(
      String email, String password);
  Future<void> signOut();
}

class AuthUseCaseImp extends AuthUseCase {
  final BaseAuthRepository _authRepository;

  AuthUseCaseImp(this._authRepository);

  @override
  Future<Either<ApiException, User>?> signInWithEmailPassword(
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
