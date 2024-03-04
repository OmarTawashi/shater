import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/data/model/data_register_model.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/model/school_model.dart';
import 'package:shater/data/model/subject_model.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/auth/base%20login/widgets/auth_mixin.dart';

import '../../../../../data/model/user.dart';

class SignUpController extends GetxController {
  final authController = Get.find<AuthController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController againPasswordController = TextEditingController();

  School? _schoolSelected;
  School? get schoolSelected => _schoolSelected;

  File? _imageFileUser;
  File? get imageFileUser => _imageFileUser;

  bool _isLoadingCheck = false;
  bool get isLoadingCheck => _isLoadingCheck;

  PublicModel? _citySelected;
  PublicModel? get citySelected => _citySelected;

  List<Classes> _classSelected = [];
  List<Classes> get classSelected => _classSelected;

  DataRegisterModel? _dataRegisterModel;
  DataRegisterModel? get dataRegisterModel => _dataRegisterModel;

  Classes? _classStudSelected;
  Classes? get classStudSelected => _classStudSelected;

  List<String> classIDS = [];

  Subject? _subjectSlected;
  Subject? get subjectSlected => _subjectSlected;

  String? _name;
  String? get name => _name;

  bool _isAgree = false;
  bool get isAgree => _isAgree;

  User? _user;
  User? get user => _user;

  AuthUseCaseImp? _authUseCaseImp;

  bool _isValidEmail = false;
  bool get isValidEmail => _isValidEmail;

  bool _isValidPassword = false;
  bool get isValidPassword => _isValidPassword;

  bool _isValidAgainPassword = false;
  bool get isValidAgainPassword => _isValidAgainPassword;

  bool get isEnable =>
      (_isValidEmail && _isValidPassword && _isValidAgainPassword && isAgree);

  @override
  void onInit() {
    super.onInit();
    _authUseCaseImp = AuthUseCaseImp(AuthRepositoryRemote(ApiClient()));
  }

  void changeAgree(bool isagree) {
    _isAgree = isagree;
    update();
  }

  void changeLoadingCheck(bool isLoad) {
    _isLoadingCheck = isLoad;
    update();
  }

  void setCity(PublicModel city) {
    _citySelected = city;
    update();
  }

  void setImageFileUSer(File? image) {
    _imageFileUser = image;
    update();
  }

  void setClassStud(Classes classe) {
    _classStudSelected = classe;
    update();
  }

  void setClasses(Classes classe) {
    if (_classSelected.contains(classe)) {
      _classSelected.remove(classe);
    } else {
      _classSelected.add(classe);
    }
    update();
  }

  void setSchool(School city) {
    _schoolSelected = city;
    update();
  }

  void setSubject(Subject subject) {
    _subjectSlected = subject;
    update();
  }

  void validEmail(String value) {
    _isValidEmail = value.contains(".com") && emailController.text.isNotEmpty;
    update();
  }

  void validPassword(String value) {
    _isValidPassword = value.length > 7 && passwordController.text.isNotEmpty;
    update();
  }

  void validAgainPassword(String value) {
    _isValidAgainPassword =
        value.length > 7 && againPasswordController.text.isNotEmpty;
    update();
  }

  void checkEmail() async {
    final email = emailController.text;
    changeLoadingCheck(true);
    await _authUseCaseImp
        ?.checkEmail(
      email,
    )
        .then((value) {
      value?.fold((l) {
        BaseMixin.showToastFlutter(messsage: l.message);
      }, (r) {
        Get.toNamed(authController.userType.routesGO);
      });
    });
    changeLoadingCheck(false);
  }
}
