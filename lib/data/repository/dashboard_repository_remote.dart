import 'dart:async';

import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/dashboard_repository.dart';
import 'package:shater/data/model/result_exam_model.dart';
import 'package:shater/data/model/subject_model.dart';
import 'package:shater/util/api_constant.dart';

import '../../core/network/api_client.dart';
import '../../core/network/api_response.dart';
import '../model/course_learning_model.dart';

class DashBoardRepositoryRemote extends DashBoardRepository {
  final ApiClient _apiClient;

  DashBoardRepositoryRemote(this._apiClient);

  @override
  Future<Either<ApiException, List<Subject>>?> fetchSubject() async {
    final completer = Completer<Either<ApiException, List<Subject>>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.getSubjects,
        requestType: RequestType.get,
        create: () => APIResponse<Subject>(
          create: () => Subject(),
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

  @override
  Future<Either<ApiException, List<CourseLearningModel>>?>
      fetchTeacherCoursesLesson(int level) async {
    final completer =
        Completer<Either<ApiException, List<CourseLearningModel>>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.getTeacherCoursesLesson + "${level}",
        requestType: RequestType.get,
        create: () => APIResponse<CourseLearningModel>(
          create: () => CourseLearningModel(),
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

  @override
  Future<Either<ApiException, List<CourseLearningModel>>?> teacherCoursesList(
      int level) async {
    final completer =
        Completer<Either<ApiException, List<CourseLearningModel>>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.teacherCoursesList + "${level}",
        requestType: RequestType.get,
        create: () => APIResponse<CourseLearningModel>(
          create: () => CourseLearningModel(),
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

  @override
  Future<Either<ApiException, List<ResultExam>>?> fetchResultSubject() async {
    final completer = Completer<Either<ApiException, List<ResultExam>>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.examSubject,
        requestType: RequestType.get,
        create: () => APIResponse<ResultExam>(
          create: () => ResultExam(),
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
