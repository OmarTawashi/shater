import 'dart:async';

import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/rate_student_repository.dart';
import 'package:shater/data/model/rate_school_model.dart';
import 'package:shater/data/model/student_model.dart';
import 'package:shater/util/api_constant.dart';

import '../../core/network/api_client.dart';
import '../../core/network/api_response.dart';

class RateStudentRepositoryRemote extends RateStudentRepository {
  final ApiClient _apiClient;

  RateStudentRepositoryRemote(this._apiClient);

  @override
  Future<Either<ApiException, List<StudentModel>>?> fetchStudentsRate() async {
    final completer = Completer<Either<ApiException, List<StudentModel>>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.studentRates,
        requestType: RequestType.get,
        create: () => APIResponse<StudentModel>(
          create: () => StudentModel(),
        ),
        onSuccess: (response) {
          final data = response.data?.items;
          if (data != null) {
            completer.complete(right(data));
          }
        },
        onError: (error) {
          completer.complete(left(error));
        },
      );
    } on ApiException catch (error) {
      completer.complete(left(error));
    }
    return completer.future;
  }

  Future<Either<ApiException, List<SchoolRateModel>>?> fetchSchoolsRate() async {
    final completer = Completer<Either<ApiException, List<SchoolRateModel>>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.schoolsRates,
        requestType: RequestType.get,
        create: () => APIResponse<SchoolRateModel>(
          create: () => SchoolRateModel(),
        ),
        onSuccess: (response) {
          final data = response.data?.items;
          if (data != null) {
            completer.complete(right(data));
          }
        },
        onError: (error) {
          completer.complete(left(error));
        },
      );
    } on ApiException catch (error) {
      completer.complete(left(error));
    }
    return completer.future;
  }
}
