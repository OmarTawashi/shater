import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/data_register_model.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/model/school_model.dart';

abstract class PublicUseCase {
  Future<Either<ApiException, List<PublicModel>>?> fetchCity();
  Future<Either<ApiException, List<School>>?> fetchSchool(
      int cityId, String type);
  Future<Either<ApiException, DataRegisterModel>?> fetchLevel(
    int cityId,
    int schoolId,
  );
}
