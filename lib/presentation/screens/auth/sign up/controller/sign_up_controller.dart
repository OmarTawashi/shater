import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/model/school_model.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/auth_repository_remote.dart';
import 'package:shater/domain/usecase/auth_usecase_imp.dart';

class SignUpController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController againPasswordController = TextEditingController();

  int? _countryId;
  int? get countryId => _countryId;

  School? _schoolSelected;
  School? get schoolSelected => _schoolSelected;

  PublicModel? _citySelected;
  PublicModel? get citySelected => _citySelected;

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

  void setCity(PublicModel city) {
    _citySelected = city;
    update();
  }

  void setSchool(School city) {
    _schoolSelected = city;
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

  void registerWithEmailPassword() async {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmationPassword = againPasswordController.text;
    await _authUseCaseImp
        ?.registerWithEmailPassword(
      email,
      password,
      confirmationPassword,
      schoolSelected?.id ?? -1,
      _name ?? '',
      _countryId ?? -1,
      _citySelected?.id ?? -1,
    )
        .then((value) {
      value?.fold((l) {}, (r) {
        _user = r;
        update();
      });

      update();
    });
  }
}
