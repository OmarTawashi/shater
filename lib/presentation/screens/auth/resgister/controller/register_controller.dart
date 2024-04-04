import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';
import 'package:shater/routes/app_routes.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();

  final signUpController = Get.find<SignUpController>();
  final authController = Get.find<AuthController>();

  User? _user;
  User? get user => _user;

  AuthUseCaseImp? _authUseCaseImp;

  bool _isLoading = false;
  bool get isloading => _isLoading;

  bool _isValidName = false;
  bool get isValidName => _isValidName;

  void changeLoading(bool isLoad) {
    _isLoading = isLoad;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _authUseCaseImp = AuthUseCaseImp(AuthRepositoryRemote(ApiClient()));
  }

  void validName(String value) {
    List<String> words = value.split(' ');
    _isValidName = words.length >= 2;
    update();
  }

  void registerTeacher() async {
    final email = signUpController.emailController.text;
    final password = signUpController.passwordController.text;
    final confirmationPassword = signUpController.againPasswordController.text;
    final name = nameController.text;
    final image = signUpController.imageFileUser;
    final countryId = 18;
    signUpController.classSelected.forEach((element) {
      if (!signUpController.classIDS.contains(element.id)) {
        signUpController.classIDS.add(element.id ?? '');
      }
    });
    update();
    changeLoading(true);
    await _authUseCaseImp
        ?.registerTeacher(
            email,
            password,
            confirmationPassword,
            signUpController.schoolSelected?.id ?? -1,
            name,
            signUpController.subjectSlected?.title ?? '',
            signUpController.classSelected.first.countryId ?? countryId,
            signUpController.citySelected?.id ?? -1,
            "${signUpController.classIDS}",
            image)
        .then((value) {
      value?.fold((l) {
        BaseMixin.showToastFlutter(messsage: l.message);
      }, (r) {
        _user = r;
        update();
        if (_user != null) {
          Get.offAllNamed(Routes.getDashBoardScreen());
        }
      });
      changeLoading(false);
    });
  }

  void registerStudent() async {
    final email = signUpController.emailController.text;
    final password = signUpController.passwordController.text;
    final confirmationPassword = signUpController.againPasswordController.text;
    final image = signUpController.imageFileUser;
    final name = nameController.text;
    final countryId = 18;
    changeLoading(true);
    await _authUseCaseImp
        ?.registerStudent(
            email,
            password,
            confirmationPassword,
            signUpController.schoolSelected?.id ?? -1,
            name,
            countryId,
            signUpController.citySelected?.id ?? -1,
            signUpController.classStudSelected?.id ?? '',
            image)
        .then((value) {
      value?.fold((l) {
        BaseMixin.showToastFlutter(messsage: l.message);
      }, (r) {
        _user = r;
        update();
        if (_user != null) {
          Get.offAllNamed(Routes.getDashBoardScreen());
        }
      });
      changeLoading(false);
    });
  }

  void getFunUserType(AuthType type) {
    switch (type) {
      case AuthType.student:
        return registerStudent();
      case AuthType.teacher:
        return registerTeacher();
      default:
        return registerStudent();
    }
  }
}
