import 'package:shater/core/data/repository/auth_repository.dart';

import '../../../model/user.dart';

abstract class AuthUseCase {
  Future<User?> signInWithEmailPassword(String email, String password);
  Future<void> signOut();
}

class AuthUseCaseRemote extends AuthUseCase{
  final AuthRepository _authRepository;

  AuthUseCaseRemote(this._authRepository);
  
  @override
  Future<User?> signInWithEmailPassword(String email, String password) {
       return _authRepository.signInWithEmailPassword(email, password);
  }
  
  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

}
