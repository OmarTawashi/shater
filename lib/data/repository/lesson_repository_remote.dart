import 'dart:async';

import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/lesson_repository.dart';
import 'package:shater/data/model/comment_model.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/teacher_exercise_model.dart';
import 'package:shater/util/api_constant.dart';

import '../../core/network/api_client.dart';
import '../../core/network/api_response.dart';

class LessonRepositoryRemote extends LessonRepository {
  final ApiClient _apiClient;

  LessonRepositoryRemote(this._apiClient);
  @override
  Future<Either<ApiException, List<CommentModel>>?> fetchComment(
      int? videoID) async {
    final completer = Completer<Either<ApiException, List<CommentModel>>?>();
    final param = {"video_id": videoID};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.commentsList,
        requestType: RequestType.get,
        queryParams: param,
        create: () => APIResponse<CommentModel>(
          create: () => CommentModel(),
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
  Future<Either<ApiException, EmptyModel>?> sendComment(
      int? videoID, String? comment) async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    final param = {"video_id": videoID, "comment": comment};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.commentStore,
        requestType: RequestType.post,
        queryParams: param,
        create: () => APIResponse<EmptyModel>(
          create: () => EmptyModel(),
        ),
        onSuccess: (response) {
          final data = response.data;
          if (data?.status == true) {
            completer.complete(right(EmptyModel(message: data?.message)));
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
  Future<Either<ApiException, EmptyModel>?> sendRatingVideo(
      int? teacherID, int? videoID, double? rate) async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    final data = {"video_id": videoID, "teacher_id": teacherID, "rate": rate};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.rateVideo,
        requestType: RequestType.post,
        create: () => APIResponse<EmptyModel>(
          create: () => EmptyModel(),
        ),
        data: data,
        onSuccess: (response) {
          final data = response.data;
          if (data?.status == true) {
            completer.complete(right(EmptyModel(message: data?.message)));
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
  Future<Either<ApiException, List<TeacherExerciseModel>>?> fetchVideoPage(
      int? pageID, int? subjectID) async {
    final completer =
        Completer<Either<ApiException, List<TeacherExerciseModel>>?>();
    final param = {"page_id": pageID, "subject_id": subjectID};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.getVideoOfPage,
        requestType: RequestType.get,
        queryParams: param,
        create: () => APIResponse<TeacherExerciseModel>(
          create: () => TeacherExerciseModel(),
        ),
        onSuccess: (response) {
          final data = response.data?.items;
          if (data != null) {
            completer.complete(right(data));
          } else {
            completer.complete(left(ApiException(message: 'Empty_view')));
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
