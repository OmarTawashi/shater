import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/profile_repository.dart';
import 'package:shater/core/usecase/profile_usecase.dart';
import 'package:shater/data/model/user.dart';

class ProfileUseCaseImp extends ProfileUseCase {
  final ProfileRepository _profileRepository;

  ProfileUseCaseImp(this._profileRepository);

  @override
  Future<Either<ApiException, User>?> fetchProfile() {
    return _profileRepository.fetchProfile();
  }
}
