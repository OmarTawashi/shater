import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/data/repository/auth_repository.dart';
import 'package:shater/core/data/usecase/auth_usecase.dart';
import 'package:shater/model/user.dart';

import '../../../../../config/api_constant.dart';
import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/api_response.dart';
import '../../../../../model/empty_model.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isHide = true;
  bool get isHide => _isHide;

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

  void changeHide() {
    _isHide = !isHide;
    update();
  }

  void changeEnable(bool isEnable) {
    _isEnable = isEnable;
    update();
  }

  void signInWithEmailPassword() async {
    final email = emailController.text;
    final password = passwordController.text;
   await _authUseCaseImp?.signInWithEmailPassword(email, password).then((value) {
      value?.fold((l) {
        print('error');
      }, (r) {
        _user = r;
        update();
      });
      print(value);
      update();
    });
  }

  void checkEmail() async {
    final data = {
      "email": emailController.text,
    };

    await ApiClient.requestData(
      endpoint: ApiConstant.checkEmail,
      requestType: RequestType.post,
      create: () => APIResponse<EmptyModel>(
        create: () => EmptyModel(),
      ),
      data: data,
      onSuccess: (response) {},
      onError: (error) {},
    );
  }
}
