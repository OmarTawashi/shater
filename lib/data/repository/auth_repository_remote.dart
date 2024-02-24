import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/base/base_mixin.dart';
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
          if (response.data?.status == false ?? false) {
            BaseMixin.showToastFlutter(
              messsage: response.data?.errors?.first.message,
            );
          } else {
            final user = response.data?.item;
            completer.complete(Right(user ?? User()));
            if (user != null) {
              SharedPrefs.saveUser(user);
              ApiClient.updateHeader();
            }
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
  Future<Either<ApiException, User>?> registerWithEmailPassword(
      String email,
      String password,
      String passwordConfirmation,
      int schoolId,
      String name,
      int countryId,
      int cityId) async {
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
          "password_confirmation": passwordConfirmation,
          "FCM_token": fcmToken,
          "device_type": "ios",
          "school_id": schoolId,
          "name": name,
          "country_id": countryId,
          "city_id": cityId,
        },
        onSuccess: (response) {
          if (response.data?.status == false ?? false) {
            BaseMixin.showToastFlutter(
              messsage: response.data?.errors?.first.message,
            );
          } else {
            completer.complete(Right(response.data?.item ?? User()));
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

  Future<void> signOut() async {
    throw UnimplementedError();
  }
}
