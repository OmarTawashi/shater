import 'dart:async';
import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/profile_repository.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/util/api_constant.dart';
import '../../core/network/api_client.dart';
import '../../core/network/api_response.dart';

class ProfileRepositoryRemote extends ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepositoryRemote(this._apiClient);

  @override
  Future<Either<ApiException, User>?> fetchProfile() async {
    final completer = Completer<Either<ApiException, User>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.profile,
        requestType: RequestType.get,
        create: () => APIResponse<User>(
          create: () => User(),
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
  Future<Either<ApiException, EmptyModel>?> shareExam(exam) async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    final param = {'exam': exam};
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.shareExam,
        requestType: RequestType.post,
        queryParams: param,
        create: () => APIResponse<EmptyModel>(
          create: () => EmptyModel(),
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
