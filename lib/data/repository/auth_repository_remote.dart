import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/base/device_info_sevice.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/network/api_response.dart';
import 'package:shater/core/repository/auth_repository.dart';

import '../../core/controller/shared_prefrences.dart';
import '../../core/network/api_client.dart';
import '../../util/api_constant.dart';
import '../model/user.dart';

class AuthRepositoryRemote extends BaseAuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryRemote(this._apiClient);

  Future<Either<ApiException, User>?> signInWithEmailPassword(
      String email, String password) async {
    final completer = Completer<Either<ApiException, User>?>();
    final fcmToken = SharedPrefs.fcmToken ?? '';
    final deviceType = await DeviceInfoService.getDeviceType();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.studentLogin,
        requestType: RequestType.post,
        create: () => APIResponse<User>(
          create: () => User(),
        ),
        data: {
          "email": email,
          "password": password,
          "FCM_token": fcmToken,
          "device_type": 'ios'
        },
        onSuccess: (response) {
          completer.complete(Right(response.data?.item ?? User()));
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
  Future<Either<ApiException, User>?> registerWithEmailPassword(
      String email, String password) async {
    final completer = Completer<Either<ApiException, User>?>();
    final fcmToken = SharedPrefs.fcmToken ?? '';
    final deviceType = await DeviceInfoService.getDeviceType();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.registerLogin,
        requestType: RequestType.post,
        create: () => APIResponse<User>(
          create: () => User(),
        ),
        data: {
          "email": email,
          "password": password,
          "FCM_token": fcmToken,
          "device_type": "ios",
        },
        onSuccess: (response) {
          completer.complete(Right(response.data?.item ?? User()));
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

  Future<void> signOut() async {
    throw UnimplementedError();
  }
}
