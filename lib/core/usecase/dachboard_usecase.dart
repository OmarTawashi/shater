

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';

import '../../data/model/subject_model.dart';

abstract class DashBoardUseCase {
  Future<Either<ApiException, List<Subject>>?> fetchSubject();
 
}