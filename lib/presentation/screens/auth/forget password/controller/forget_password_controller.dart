import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';

class ForgetPasswordController extends BaseController {
  TextEditingController emailController = TextEditingController();

  bool _isValidEmail = false;
  bool get isValidEmail => _isValidEmail;

  bool get isEnable => (_isValidEmail);

  AuthUseCaseImp? _authUseCaseImp;

  @override
  void onInit() {
    super.onInit();
    _authUseCaseImp = AuthUseCaseImp(AuthRepositoryRemote(ApiClient()));
  }

  void validEmail(String value) {
    _isValidEmail = value.contains(".com") && emailController.text.isNotEmpty;
    update();
  }

  void forgetPassword() async {
    final email = emailController.text;
    changeLoading(true);
    await _authUseCaseImp?.ForgetPassword(
      email,
    ).then((value) {
      changeLoading(false);
      value?.fold((l) {
        BaseMixin.showToastFlutter(messsage: l.message);
      }, (r) {
        BaseMixin.showToastFlutter(messsage: r.message);
        Get.back();
      });
    });
    // changeLoadingCheck(false);
  }
}
