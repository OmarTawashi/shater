import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/subject_model.dart';

abstract class DashBoardRepository {
   Future<Either<ApiException, List<Subject>>?> fetchSubject();

}