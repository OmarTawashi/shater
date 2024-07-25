import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/user.dart';

import '../../data/model/qualification_response.dart';
import '../../data/model/qualifications_model.dart';

abstract class ProfileUseCase {
  Future<Either<ApiException, User>?> fetchProfile(String token,
      {bool isTeacher = false});

  Future<Either<ApiException, List<QualificationResponse>>?>
      getTeacherQualifications({required int id});

  Future<void> teacherAddQualifications(
      {required Map<String, dynamic> mapDta,
      required File file,
      required int id , required Function onResponse});

  Future<Either<ApiException, EmptyModel>?> shareExam(exam);
}
