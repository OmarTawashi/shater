import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/device_info_sevice.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/network/api_response.dart';
import 'package:shater/core/repository/auth_repository.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';

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
            completer.complete(left(ApiException(
              message: response.data?.errors?.first.message ?? "",
              response: response.response,
            )));
          } else {
            final user = response.data?.item;
            if (user != null) {
              SharedPrefs.saveUser(user);
              ApiClient.updateHeader();
              completer.complete(Right(user!));
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
  Future<Either<ApiException, User>?> registerStudent(
      String email,
      String password,
      String passwordConfirmation,
      int schoolId,
      String name,
      int countryId,
      int cityId,
      String classId,
      File? imageFile) async {
    final completer = Completer<Either<ApiException, User>?>();
    final fcmToken = SharedPrefs.fcmToken ?? '';
    final deviceType = await DeviceInfoService.getDeviceType();
    final data = {
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "FCM_token": fcmToken,
      "device_type": "ios",
      "school_id": schoolId,
      "name": name,
      "country_id": countryId,
      "city_id": cityId,
      "class_id": classId,
    };
    dio.FormData formData = await dio.FormData.fromMap(data);
    if (imageFile != null) {
      formData.files.add(MapEntry(
        'image',
        await dio.MultipartFile.fromFile(imageFile.path ?? ''),
      ));
    }
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.registerSudent,
        requestType: RequestType.post,
        create: () => APIResponse<User>(
          create: () => User(),
        ),
        data: formData,
        headers: {
          'Content-Type': 'multipart/form-data; boundary=${formData.boundary}',
        },
        onSuccess: (response) {
          if (response.data?.status == false ?? false) {
            completer.complete(left(ApiException(
              message: response.data?.errors?.first.message ?? "",
              response: response.response,
            )));
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
  Future<Either<ApiException, User>?> registerTeacher(
    String email,
    String password,
    String passwordConfirmation,
    int schoolId,
    String name,
    String subjectName,
    int countryId,
    int cityId,
    String classesId,
    File? imageFile,
  ) async {
    final completer = Completer<Either<ApiException, User>?>();
    final fcmToken = SharedPrefs.fcmToken ?? '';
    final deviceType = await DeviceInfoService.getDeviceType();
    final data = {
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "FCM_token": fcmToken,
      "device_type": "ios",
      "school_id": schoolId,
      "name": name,
      "subject_name": subjectName,
      "country_id": countryId,
      "city_id": cityId,
      "classes": classesId,
    };
    dio.FormData formData = await dio.FormData.fromMap(data);
    if (imageFile != null) {
      formData.files.add(MapEntry(
        'image',
        await dio.MultipartFile.fromFile(imageFile.path ?? ''),
      ));
    }
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.registerTeacher,
        requestType: RequestType.post,
        create: () => APIResponse<User>(
          create: () => User(),
        ),
        data: formData,
        headers: {
          'Content-Type': 'multipart/form-data; boundary=${formData.boundary}',
        },
        onSuccess: (response) {
          if (response.data?.status == false ?? false) {
            completer.complete(left(ApiException(
              message: response.data?.errors?.first.message ?? "",
              response: response.response,
            )));
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
  Future<Either<ApiException, EmptyModel>?> checkEmail(String email) async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    final authController = Get.find<AuthController>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.checkEmail,
        requestType: RequestType.post,
        create: () => APIResponse<EmptyModel>(
          create: () => EmptyModel(),
        ),
        data: {
          "email": email,
        },
        onSuccess: (response) {
          if (response.data?.status == false ?? false) {
            completer.complete(left(ApiException(
              message: response.data?.errors?.first.message ?? "",
              response: response.response,
            )));
          } else {
            final user = response.data?.item;
            completer.complete(Right(user ?? EmptyModel()));
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
  Future<Either<ApiException, EmptyModel>?> ForgetPassword(String email) async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.ForgetPassword,
        requestType: RequestType.post,
        create: () => APIResponse<EmptyModel>(
          create: () => EmptyModel(),
        ),
        data: {
          "email": email,
        },
        onSuccess: (response) {
          if (response.data?.status == false ?? false) {
            completer.complete(left(ApiException(
              message: response.data?.errors?.first.message ?? "",
              response: response.response,
            )));
          } else {
            final message = response.data?.message;
            completer.complete(Right(EmptyModel(message: message)));
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

  Future<Either<ApiException, EmptyModel>?> signOut() async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.logout,
        requestType: RequestType.post,
        create: () => APIResponse<EmptyModel>(
          create: () => EmptyModel(),
        ),
        onSuccess: (response) {
          if (response.data?.status == false) {
            completer.complete(left(ApiException(
              message: response.data?.errors?.first.message ?? "",
              response: response.response,
            )));
          } else {
            final user = response.data?.item;
            completer.complete(Right(user ?? EmptyModel()));
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
