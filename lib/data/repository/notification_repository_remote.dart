import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/network/api_response.dart';
import 'package:shater/core/repository/notification_repository.dart';
import 'package:shater/data/model/notification_model.dart';
import 'package:shater/util/api_constant.dart';

class NotificationRepositoryRemote extends NotificationRepository {
  final ApiClient _apiClient;

  NotificationRepositoryRemote(this._apiClient);

  @override
  Future<Either<ApiException, List<NotificationModel>>?>
      fetchNotification() async {
    final completer =
        Completer<Either<ApiException, List<NotificationModel>>?>();

    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.notifications,
        requestType: RequestType.get,
        create: () => APIResponse<NotificationModel>(
          create: () => NotificationModel(),
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
