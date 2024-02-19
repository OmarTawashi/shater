import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/data/repository/auth_repository.dart';
import 'package:shater/domain/usecase/auth_usecase.dart';

import '../../../../../data/model/empty_model.dart';
import '../../../../../domain/network/api_client.dart';
import '../../../../../domain/network/api_response.dart';
import '../../../../../util/api_constant.dart';

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
        print('error :${l.message}');
        //this is error 
      }, (r) {
        _user = r;
        // this is user 
         print(r);
        update();
      });
     
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
