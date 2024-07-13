import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';
import 'package:shater/routes/app_routes.dart';

import '../../../../../core/controller/shared_prefrences.dart';

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

  User? _parentUser;
  User? get parentUser => _parentUser;

  ChildUser? _childUser;
  ChildUser? get childUser => _childUser;

  ChildUser? selectedChild ;


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

  bool isSelectedChild(int userId){
    selectedChild = SharedPrefs.selectedChild;
    if(userId == selectedChild?.id){
      return true;
    }else{
      return false;
    }
  }

  void changeSelectedChild(ChildUser selectedUser){
    this.selectedChild = selectedUser;
    SharedPrefs.saveSelectedChild(selectedChild!);
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
        _parentUser = user;
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
          defTeacher(user);
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
      log("login 1");
      //this is mean the father not have any child
      Get.offAllNamed(Routes.getDashBoardScreen());
    } else {
      log("login 2");
      // in this the father select what the child login
      selectedChild = user.children?[0];
      SharedPrefs.saveSelectedChild(user.children![0]);
      BaseMixin.bottomSheetChildern();
    }
  }

  void defTeacher(User? user) {
    if (user?.children == null || user!.children!.isEmpty) {
      //this is mean the father not have any child
      Get.offAllNamed(Routes.getTeacherDashBoardScreen());
    } else {
      // in this the father select what the child login
      selectedChild = user.children?[0];
      BaseMixin.bottomSheetChildern();
    }
  }

  void childSignIn(int id) async {
    changeLoading(true);
    await _authUseCaseImp
        ?.childSignIn(parentUser?.email ?? '', id ,(parentUser?.id ?? 0) )
        .then((value) {
      value?.fold((l) {
        BaseMixin.showToastFlutter(messsage: l.message);
      }, (user) {
        _childUser = ChildUser.fromJson(user.toJson());
        update();
        distinctUser(user);
      });
      changeLoading(false);
      update();
    });
  }
}
