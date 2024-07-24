import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:fpdart/src/either.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/profile_repository.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/util/api_constant.dart';

import '../../core/network/api_client.dart';
import '../../core/network/api_response.dart';
import '../model/qualifications_model.dart';
import '../../data/model/qualification_response.dart';
import 'package:shater/util/dio_manager/dio_manage_class.dart';

class ProfileRepositoryRemote extends ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepositoryRemote(this._apiClient);

  @override
  Future<Either<ApiException, User>?> fetchProfile(String token,
      {bool isTeacher = false}) async {
    final completer = Completer<Either<ApiException, User>?>();
    try {
      await ApiClient.requestData(
        endpoint: isTeacher ? ApiConstant.teacherProfile : ApiConstant
            .studentProfile,
        headers: ApiConstant.getHeader(token),
        requestType: RequestType.get,
        create: () =>
            APIResponse<User>(
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
        create: () =>
            APIResponse<EmptyModel>(
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

  @override
  Future<Either<ApiException,
      List<QualificationResponse>>?> getTeacherQualifications(
      {required int id}) async {
    final completer = Completer<
        Either<ApiException, List<QualificationResponse>>?>();
    try {
      await ApiClient.requestData(
        endpoint: ApiConstant.teacherQualifications(id),
        headers: ApiConstant.header(TypeToken.Authorization),
        requestType: RequestType.get,
        create: () =>
            APIResponse<QualificationResponse>(
              create: () => QualificationResponse(),
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
  Future<void> teacherAddQualifications(
      {required Map<String , dynamic> mapDta , required File file , required int id , required Function onResponse}) async {
    final completer = Completer<Either<ApiException, EmptyModel>?>();
    try {
      final completer = Completer<Either<ApiException, EmptyModel>?>();
      final data = mapDta;
      dio.FormData formData = await dio.FormData.fromMap(data);
      formData.files.add(MapEntry(
        'image',
        await dio.MultipartFile.fromFile(file.path ?? ''),
      ));
      await ApiClient.requestData(
        endpoint: ApiConstant.teacherAddQualifications(id),
        headers: ApiConstant.header(TypeToken.Authorization),
        data : data,
        requestType: RequestType.post,
        create: () => EmptyModel(),
        onSuccess: (response) async {
          log("teacherAddQualifications response");
          // return EmptyModel(message: "success");
        },
        onError: (error) {
          completer.complete(left(error));
        },
      );
    } on ApiException catch (error) {
      completer.complete(left(error));
    }
    // return completer.future;
  }
}


