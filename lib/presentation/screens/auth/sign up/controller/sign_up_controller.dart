import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/data/model/models.dart';

import '../../../../../data/repository/auth_repository.dart';
import '../../../../../domain/network/api_client.dart';
import '../../../../../domain/usecase/auth_usecase.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController againPasswordController = TextEditingController();

  bool _isEnable = false;
  bool get isEnable => _isEnable;

  User? _user;
  User? get user => _user;

  AuthUseCaseImp? _authUseCaseImp;

  @override
  void onInit() {
    super.onInit();
    _authUseCaseImp = AuthUseCaseImp(AuthRepositoryRemote(ApiClient()));
  }

  void changeEnable(bool isEnable) {
    _isEnable = isEnable;
    update();
  }
}
