import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/network/api_response.dart';
import 'package:shater/core/repository/teacher_repository.dart';
import 'package:shater/data/model/SubjectPagesModel.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/data/model/specific_page_exercises_model.dart';
import 'package:shater/data/model/subject_video_model.dart';
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

  @override
  Future<Either<ApiException, EmptyModel>?> sendTeacherRead(
      int? teacherID) async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    final data = {"teacher_id": teacherID};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.teacherAsRead,
        requestType: RequestType.post,
        create: () => APIResponse<EmptyModel>(
          create: () => EmptyModel(),
        ),
        data: data,
        onSuccess: (response) {
          final data = response.data?.message;
          completer.complete(right(EmptyModel(message: data)!));
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
  Future<Either<ApiException, List<SubjectVideo>>?> fetchVideoOfSubject(
      int? page, int? subjectId, int? userID, int? publishTo) async {
    final completer = Completer<Either<ApiException, List<SubjectVideo>>?>();
    final data = {
      "page": page,
      "subject_id": subjectId,
      "user_id": userID,
      "publish_to": publishTo,
    };
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.getVideoOfSubject,
        requestType: RequestType.get,
        create: () => APIResponse<SubjectVideo>(
          create: () => SubjectVideo(),
        ),
        queryParams: data,
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
  Future<Either<ApiException, List<SubjectVideo>>?> fetchVideoOfSubject2(
      {required int publishTo,
      required int subjectId,
      required int userID}) async {
    final completer = Completer<Either<ApiException, List<SubjectVideo>>?>();
    final data = {
      "subject_id": subjectId,
      "user_id": userID,
      "publish_to": publishTo,
    };
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.getVideoOfSubjectteacher,
        requestType: RequestType.get,
        create: () => APIResponse<SubjectVideo>(
          create: () => SubjectVideo(),
        ),
        queryParams: data,
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
  Future<Either<ApiException, SubjectPagesModel>?>
      getTeacherCoursesExercisesList({required int course_id}) async {
    final completer = Completer<Either<ApiException, SubjectPagesModel>?>();
    try {
      await ApiClient.requestData(
        endpoint:
            "/api/${ApiConstant.version}/teacher/lesson/$course_id/get-subject-pages",
        requestType: RequestType.get,
        create: () => SubjectPagesModel(),
        onSuccess: (response) {
          final data = response.data;
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
  Future<Either<ApiException, QuestionPageModel>?>
      getSpecificPageExercisesList(
          {required int subject_id,
          required int pageFrom,
          required int pageTo}) async {
    final completer = Completer<Either<ApiException, QuestionPageModel>?>();
    final data = {
      "subject_id": subject_id,
      "pageFrom": pageFrom,
      "pageTo": pageTo,
    };
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.specificPageExercise,
        requestType: RequestType.get,
        create: () =>  QuestionPageModel(),
        
        queryParams: data,
        onSuccess: (response) {
          final data = response.data;
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
