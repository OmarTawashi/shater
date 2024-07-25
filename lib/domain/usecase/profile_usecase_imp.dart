import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/profile_repository.dart';
import 'package:shater/core/usecase/profile_usecase.dart';
import 'package:shater/data/model/empty_model.dart';
import 'package:shater/data/model/user.dart';

import '../../data/model/qualification_response.dart';

class ProfileUseCaseImp extends ProfileUseCase {
  final ProfileRepository _profileRepository;

  ProfileUseCaseImp(this._profileRepository);

  @override
  Future<Either<ApiException, User>?> fetchProfile(String token,
      {bool isTeacher = false}) {
    return _profileRepository.fetchProfile(token, isTeacher: isTeacher);
  }

  @override
  Future<Either<ApiException, List<QualificationResponse>>?> getTeacherQualifications({required int id}) {
    return _profileRepository.getTeacherQualifications(id: id);
  }

  @override
  Future<void> teacherAddQualifications(
      {required Map<String , dynamic> mapDta , required File file , required int id , required Function onResponse}) {
    return _profileRepository.teacherAddQualifications(mapDta: mapDta , file: file , id: id,onResponse: onResponse);
  }

  @override
  Future<Either<ApiException, EmptyModel>?> shareExam(exam) {
    return _profileRepository.shareExam(exam);
  }
}
