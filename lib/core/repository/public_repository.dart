import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/data/model/data_register_model.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/model/school_model.dart';

abstract class PublicRepository {
  Future<Either<ApiException, List<PublicModel>>?> fetchCity(int countryId);
  Future<Either<ApiException, List<School>>?> fetchSchool(
      int cityId, String type);
  Future<Either<ApiException, DataRegisterModel>?> fetchClassStudent(
    int cityId,
    int schoolId,
  );
  Future<Either<ApiException, List<Classes>>?> fetchClassTeacher(
      String subject, int countryId);
}
