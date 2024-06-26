import 'dart:async';

import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/question_repository.dart';
import 'package:shater/data/model/page_model.dart';
import 'package:shater/data/model/question_subject_model.dart';
import 'package:shater/data/model/result_exam_model.dart';
import 'package:shater/util/api_constant.dart';

import '../../core/network/api_client.dart';
import '../../core/network/api_response.dart';

class QuestionRepositoryRemote extends QuestionRepository {
  final ApiClient _apiClient;

  QuestionRepositoryRemote(this._apiClient);

  @override
  Future<Either<ApiException, PageModel>?> fetchQuestionPage(int? subjectID) async {
    final completer = Completer<Either<ApiException, PageModel>?>();
    final param = {"subject_id": subjectID};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.questionsPage,
        requestType: RequestType.get,
        queryParams: param,
        create: () => APIResponse<PageModel>(
          create: () => PageModel(),
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

  @override
  Future<Either<ApiException, List<QuestionPageModel>>?> fetchQuestionSubject(
      int? subjectID, int? pageFrom, int? pageTo) async {
    final completer = Completer<Either<ApiException, List<QuestionPageModel>>?>();
    final param = {"subject_id": subjectID, "pageFrom": pageFrom, "pageTo": pageTo};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.questionsSubject,
        requestType: RequestType.get,
        queryParams: param,
        create: () => APIResponse<QuestionPageModel>(
          create: () => QuestionPageModel(),
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
  Future<Either<ApiException, Exam>?> fetchResultQuestion(
      int? subjectID, int? pageFrom, int? pageTo, int? total, String data, int? helpAnswer) async {
    final completer = Completer<Either<ApiException, Exam>?>();
    final body = {
      "subject_id": subjectID,
      "from_page_no": pageFrom,
      "to_page_no": pageTo,
      "total": total,
      "help_answer": helpAnswer,
      "data": data
    };
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.storeAnswer,
        requestType: RequestType.post,
        data: body,
        create: () => APIResponse<Exam>(
          create: () => Exam(),
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
