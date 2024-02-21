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

  Future<void> signOut() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, User>?> registerWithEmailPassword(
      String email, String password) async {
    final completer = Completer<Either<Exception, User>?>();
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
          "FCM_token":
              "d0LO1pR8wUvchHXDJSsqAh:APA91bFlZcKZ-7QiIAJDzCjGbvw836c-7VlSCZj5GHZXJ1xWH8frJ9x5966HJygKlfQ5X4C3F294xCZ3FmfsPK2tzjCdmjxDO18dfLtZHB_pprht3Ysqsg7iE2WKbQNM6NhVojITmKTJ",
          "device_type": "ios"
        },
        onSuccess: (response) {
          completer.complete(Right(response.data?.item ?? User()));
        },
        onError: (error) {
          completer.complete(left(error));
        },
      );
    } on Exception catch (error) {
      completer.complete(left(error));
    }
    return completer.future;
  }
}
