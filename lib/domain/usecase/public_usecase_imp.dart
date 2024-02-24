import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/public_repository.dart';
import 'package:shater/core/usecase/public_usecase.dart';
import 'package:shater/data/model/public_model.dart';

import '../../data/model/school_model.dart';

class publicUseCaseImp extends PublicUseCase {
  final PublicRepository _publicRepository;

  publicUseCaseImp(this._publicRepository);

  @override
  Future<Either<ApiException, List<PublicModel>>?> fetchCity() {
    return _publicRepository.fetchCity();
  }

  @override
  Future<Either<ApiException, List<School>>?> fetchSchool(
      int cityId, String type) {
    return _publicRepository.fetchSchool(cityId, type);
  }
}
