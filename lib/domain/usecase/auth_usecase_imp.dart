import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/auth_repository.dart';
import 'package:shater/core/usecase/auth_usecase.dart';
import 'package:shater/data/model/empty_model.dart';

import '../../data/model/user.dart';

class AuthUseCaseImp extends AuthUseCase {
  final BaseAuthRepository _authRepository;

  AuthUseCaseImp(this._authRepository);

  @override
  Future<Either<ApiException, User>?> signInWithEmailPassword(
      String email, String password) {
    return _authRepository.signInWithEmailPassword(email, password);
  }

  @override
  Future<Either<ApiException, User>?> childSignIn(
      String email, int id, int parentId) {
    return _authRepository.childSignIn(email, id, parentId);
  }

  @override
  Future<Either<ApiException, EmptyModel>?> signOut() {
    return _authRepository.signOut();
  }

  @override
  Future<Either<ApiException, EmptyModel>?> deleteAccount() {
    return _authRepository.deleteAccount();
  }

  @override
  Future<Either<ApiException, EmptyModel>?> checkEmail(String email) {
    return _authRepository.checkEmail(email);
  }

  @override
  Future<Either<ApiException, EmptyModel>?> ForgetPassword(String email) {
    return _authRepository.ForgetPassword(email);
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
      File? imageFile) {
    return _authRepository.registerStudent(
        email,
        password,
        passwordConfirmation,
        schoolId,
        name,
        countryId,
        cityId,
        classId,
        imageFile);
  }

  Future<Either<ApiException, ChildUser>?> addChild(int parentId,String fullName, int schoolId,
      int cityId, String classId, File? imageFile) {
    return _authRepository.addChild(
        parentId,fullName, schoolId, cityId, classId, imageFile);
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
      String classIDS,
      File? imageFile) {
    return _authRepository.registerTeacher(
        email,
        password,
        passwordConfirmation,
        schoolId,
        name,
        subjectName,
        countryId,
        cityId,
        classIDS,
        imageFile);
  }
}
