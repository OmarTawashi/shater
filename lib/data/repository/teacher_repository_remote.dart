import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/network/api_response.dart';
import 'package:shater/core/repository/teacher_repository.dart';
import 'package:shater/data/model/teacher_model.dart';
import 'package:shater/util/api_constant.dart';

class TeacherRepositoryRemote extends TeacherRepository {
  final ApiClient _apiClient;

  TeacherRepositoryRemote(this._apiClient);

  @override
  Future<Either<ApiException, List<TeacherModel>>?> fetchTeachers(
      int? subjectId) async {
    final completer = Completer<Either<ApiException, List<TeacherModel>>?>();
    final param = {
      'subject_id': subjectId,
      'publish_to': 1,
    };
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.teacherOfStudent,
        requestType: RequestType.get,
        create: () => APIResponse<TeacherModel>(
          create: () => TeacherModel(),
        ),
        queryParams: subjectId != null ? param : null,
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
