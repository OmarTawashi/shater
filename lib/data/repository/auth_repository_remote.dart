import 'dart:async';
import 'dart:developer';
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
import '../../flavors/dio_manage_class.dart';
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
          "device_type": deviceType
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
              SharedPrefs.saveUser(user, "signInWithEmailPassword 1");
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

  Future<Either<ApiException, User>?> childSignIn(
      String email, int id, int parentId) async {
    final completer = Completer<Either<ApiException, User>?>();
    final fcmToken = SharedPrefs.fcmToken ?? '';
    final deviceType = await DeviceInfoService.getDeviceType();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.childLogin,
        requestType: RequestType.post,
        create: () => APIResponse<User>(
          create: () => User(),
        ),
        data: {
          "FCM_token": fcmToken,
          "device_type": deviceType,
          "email": email,
          "id": id,
          "parent_id": parentId
        },
        onSuccess: (response) {
          if (response.data?.status == false ?? false) {
            completer.complete(left(ApiException(
              message: response.data?.errors?.first.message ?? "",
              response: response.response,
            )));
          } else {
            log("child login success");
            final user = response.data?.item;
            if (user != null) {
              SharedPrefs.saveSelectedChild(ChildUser.fromJson(user.toJson()));
              ApiClient.updateHeader();
              completer.complete(Right(user));
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
              SharedPrefs.saveUser(user, "registerStudent 1");
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
  Future<Either<ApiException, ChildUser>?> addChild(
      int parentId,
      String fullName,
      int schoolId,
      int cityId,
      String classId,
      File? imageFile) async {
    // final completer = Completer<Either<ApiException, ChildUser>?>();
    final data = {
      "name": fullName,
      "school_id": schoolId,
      "city_id": cityId,
      "class_id": classId,
    };
    // dio.FormData formData = await dio.FormData.fromMap(data);
    // if (imageFile != null) {
    //   formData.files.add(MapEntry(
    //     'image',
    //     await dio.MultipartFile.fromFile(imageFile.path ?? ''),
    //   ));
    // }
    try {
      if (imageFile != null) {
        var response = await DioManagerClass.getInstance.dioMultiPartPostMethod(
            url: ApiConstant.registerChild(parentId),
            header: ApiConstant.header(TypeToken.Authorization),
            file: imageFile,
            body: data,
            keyName: 'image');
      } else {
        var response = await DioManagerClass.getInstance.dioPostFormMethod(
          url: ApiConstant.registerChild(parentId),
          header: ApiConstant.header(TypeToken.Authorization),
          body: data,
        );
      }

      // await ApiClient.requestData(
      //   endpoint: ApiConstant.registerChild(parentId),
      //   requestType: RequestType.post,
      //   create: () => APIResponse<ChildUser>(
      //     create: () => ChildUser(),
      //   ),
      //   data: formData,
      //   headers: {
      //     'Content-Type': 'multipart/form-data; boundary=${formData.boundary}',
      //   },
      //   onSuccess: (response) {
      //     if (response.data?.status == false ?? false) {
      //       completer.complete(left(ApiException(
      //         message: response.data?.errors?.first.message ?? "",
      //         response: response.response,
      //       )));
      //     } else {
      //       final user = response.data?.item;
      //       completer.complete(Right(user ?? ChildUser()));
      //       if (user != null) {
      //         ApiClient.updateHeader();
      //       }
      //     }
      //   },
      //   onError: (error) {
      //     log("addChild 2 : e : ${error.message}");
      //     completer.complete(left(error));
      //   },
      // );
    } on ApiException catch (error) {
      log("addChild 2 : Exception : ${error.message}");
      // completer.complete(left(error));
    }
    return null;
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
              SharedPrefs.saveUser(user, "registerTeacher 1");
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


  Future<Either<ApiException, EmptyModel>?> deleteAccount() async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.deleteAccount,
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
