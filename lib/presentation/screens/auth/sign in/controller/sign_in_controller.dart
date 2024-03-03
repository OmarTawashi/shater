import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';
import 'package:shater/routes/app_routes.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isHide = true;
  bool get isHide => _isHide;

  bool _isLoading = false;
  bool get isloading => _isLoading;

  bool _isValidEmail = false;
  bool get isValidEmail => _isValidEmail;

  bool _isValidPassword = false;
  bool get isValidPassword => _isValidPassword;

  bool get isEnable => (_isValidEmail && _isValidPassword);

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

  void validEmail(String value) {
    _isValidEmail = value.contains(".com") && emailController.text.isNotEmpty;
    update();
  }

  void changeLoading(bool isLoad) {
    _isLoading = isLoad;
    update();
  }

  void validPassword(String value) {
    _isValidPassword = value.length > 5 && passwordController.text.isNotEmpty;
    update();
  }

  void signInWithEmailPassword() async {
    final email = emailController.text;
    final password = passwordController.text;
    changeLoading(true);
    await _authUseCaseImp
        ?.signInWithEmailPassword(email, password)
        .then((value) {
      value?.fold((l) {
        BaseMixin.showToastFlutter(messsage: l.message);
      }, (user) {
        _user = user;
        update();
        distinctUser(user);
      });
      changeLoading(false);
      update();
    });
  }

  void distinctUser(User? user) {
    if (user != null) {
      switch (user.isTeacher) {
        case 1:
          BaseMixin.showToastFlutter(messsage: 'the login is teacher');
          break;
        case 0:
          defStudent(user);
          break;
        default:
          defStudent(user);
          break;
      }
    }
  }

  void defStudent(User? user) {
    if (user?.children == null || user!.children!.isEmpty) {
      //this is mean the father not have any child
      Get.offAllNamed(Routes.getDashBoardScreen());
    } else {
      // in this the father select what the child login
      BaseMixin.bottomSheetChildern();
    }
  }
}
