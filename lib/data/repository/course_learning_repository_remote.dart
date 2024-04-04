import 'dart:async';

import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/network/api_response.dart';
import 'package:shater/core/repository/course_learning_repository.dart';
import 'package:shater/data/model/course_learning_model.dart';
import 'package:shater/util/api_constant.dart';

class CoursesLearningRepositoryRemote extends CoursesLearningRepository {
  final ApiClient _apiClient;

  CoursesLearningRepositoryRemote(this._apiClient);

 

  @override
  Future<Either<ApiException, List<CourseLearningModel>>?> fetchCourseLearning(int level) async {
    final completer = Completer<Either<ApiException, List<CourseLearningModel>>>();
    final param = {
      'level':level
    };
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.coursesLearning,
        requestType: RequestType.get,
        create: () => APIResponse<CourseLearningModel>(
          create: () => CourseLearningModel(),
        ),
        queryParams: param,
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
