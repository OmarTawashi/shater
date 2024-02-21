import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/auth_repository.dart';
import 'package:shater/core/usecase/auth_usecase.dart';

import '../../data/model/user.dart';

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
  Future<Either<ApiException, User>?> registerWithEmailPassword(
      String email, String password) {
     return _authRepository.registerWithEmailPassword(email, password);
  }
}
