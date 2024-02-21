import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController againPasswordController = TextEditingController();

  bool _isAgree = false;
  bool get isAgree => _isAgree;

  User? _user;
  User? get user => _user;

  AuthUseCaseImp? _authUseCaseImp;

  @override
  void onInit() {
    super.onInit();
    _authUseCaseImp = AuthUseCaseImp(AuthRepositoryRemote(ApiClient()));
  }

  void changeAgree(bool isAgree) {
    _isAgree = isAgree;
    update();
  }

  bool isEnable() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        againPasswordController.text.isNotEmpty &&
        emailController.text.contains('@') &&
        isAgree;
  }

  void registerWithEmailPassword() async {
    final email = emailController.text;
    final password = passwordController.text;
    await _authUseCaseImp
        ?.registerWithEmailPassword(email, password)
        .then((value) {
      value?.fold((l) {
        print('error :${l}');
      }, (r) {
        _user = r;
        print(r);
        update();
      });

      update();
    });
  }
}
