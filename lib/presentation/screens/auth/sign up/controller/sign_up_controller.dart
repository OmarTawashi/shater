import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/model/models.dart';

import '../../../../../core/data/repository/auth_repository.dart';
import '../../../../../core/data/usecase/auth_usecase.dart';
import '../../../../../core/network/api_client.dart';

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
