import 'dart:async';

import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/network/api_response.dart';
import 'package:shater/core/repository/course_learning_repository.dart';
import 'package:shater/data/model/subject_model.dart';
import 'package:shater/util/api_constant.dart';

class CoursesLearningRepositoryRemote extends CoursesLearningRepository {
  final ApiClient _apiClient;

  CoursesLearningRepositoryRemote(this._apiClient);

 

  @override
  Future<Either<ApiException, Subject>?> fetchCourseLearning(int level) async {
    final completer = Completer<Either<ApiException, Subject>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.getSubjects,
        requestType: RequestType.get,
        create: () => APIResponse<Subject>(
          create: () => Subject(),
        ),
        onSuccess: (response) {
          final data = response.data?.item;
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
