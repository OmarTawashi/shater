import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/model/qualification_response.dart';


abstract class ProfileRepository {
  Future<Either<ApiException, User>?> fetchProfile(String token,
      {bool isTeacher = false});

  Future<Either<ApiException, List<QualificationResponse>>?>
      getTeacherQualifications({required int id});

  Future<void/*Either<ApiException, EmptyModel>?*/> teacherAddQualifications(
      {required Map<String, dynamic> mapDta,
      required File file,
      required int id,
      required Function onResponse});

  Future<Either<ApiException, EmptyModel>?> shareExam(exam);
}
