import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/network/api_response.dart';
import 'package:shater/core/repository/public_repository.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/model/school_model.dart';
import 'package:shater/util/api_constant.dart';

class PublicRepositoryRemote extends PublicRepository {
  final ApiClient _apiClient;

  PublicRepositoryRemote(this._apiClient);

  @override
  Future<Either<ApiException, List<PublicModel>>?> fetchCity() async {
    final completer = Completer<Either<ApiException, List<PublicModel>>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.getCities,
        requestType: RequestType.get,
        create: () => APIResponse<PublicModel>(
          create: () => PublicModel(),
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

  Future<Either<ApiException, List<School>>?> fetchSchool(
      int cityId, String type) async {
    final completer = Completer<Either<ApiException, List<School>>?>();
    final param = {
      "city_id": cityId,
      "type": type,
    };
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.getSchools,
        requestType: RequestType.get,
        create: () => APIResponse<School>(
          create: () => School(),
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
