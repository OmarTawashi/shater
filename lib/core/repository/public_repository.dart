import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/model/school_model.dart';

abstract class PublicRepository {
  Future<Either<ApiException, List<PublicModel>>?> fetchCity();
  Future<Either<ApiException, List<School>>?> fetchSchool(int cityId,String type);
}
