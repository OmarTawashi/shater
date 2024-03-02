import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/public_repository.dart';
import 'package:shater/core/usecase/public_usecase.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/data/model/data_register_model.dart';
import 'package:shater/data/model/public_model.dart';

import '../../data/model/school_model.dart';

class publicUseCaseImp extends PublicUseCase {
  final PublicRepository _publicRepository;

  publicUseCaseImp(this._publicRepository);

  @override
  Future<Either<ApiException, List<PublicModel>>?> fetchCity(int countryId) {
    return _publicRepository.fetchCity(countryId);
  }

  @override
  Future<Either<ApiException, List<School>>?> fetchSchool(
      int cityId, String type) {
    return _publicRepository.fetchSchool(cityId, type);
  }

  @override
  Future<Either<ApiException, DataRegisterModel>?> fetchClassStudent(
      int cityId, int schoolId) {
    return _publicRepository.fetchClassStudent(cityId, schoolId);
  }
  @override
  Future<Either<ApiException, List<Classes>>?> fetchClassTeacher(
      String subject, int countryId) {
    return _publicRepository.fetchClassTeacher(subject, countryId);
  }
}
