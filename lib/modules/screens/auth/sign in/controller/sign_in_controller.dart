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

  AuthRepository? _authRepository;
  AuthUseCaseRemote? _authUseCaseRemote;

  bool _isHide = true;
  bool get isHide => _isHide;

  bool _isEnable = false;
  bool get isEnable => _isEnable;

  User? _user;
  User? get user => _user;

  @override
  void onInit() {
    super.onInit();
    _authRepository = AuthRepository(ApiClient());
    _authUseCaseRemote = AuthUseCaseRemote(_authRepository!);
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
    if (_user == null) {
      _user =
          await _authUseCaseRemote?.signInWithEmailPassword(email, password);
    } else {
      changeEnable(true);
    }
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

  // void signIn(context) async {
  //   setIsloading(true);
  //   final data = {'phone': '970${phone.text}'};

  //   await ApiClient.requestData(
  //     endpoint: ApiConfig.baseUrl,
  //     requestType: RequestType.post,
  //     create: () => APIResponse(
  //       create: () => EmptyModel(),
  //     ),
  //     data: data,
  //     onSuccess: (response) {
  // setIsloading(false);
  // Get.toNamed(Routes.getVarifyScreen(phone: phone.text));
  // },
  // onError: (error) {
  // setIsloading(false);
  // if (error.statusCode == 403) {
  // BaseMixin.alertDialog(
  //   header: SvgPicture.asset(IMAGES.fault),
  //   title: 'the_number_not_found'.tr,
  //   subTitle: 'thank_you'.tr,
  //   textButtonOk: 'go_to_register'.tr,
  //   onPressedOk: () {
  //     Get.back();
  //     Get.toNamed(Routes.getLocationScreen());
  //   },
  // );
  // } else {/
  // BaseMixin.showToastFlutter(
  //   context,
  //   messsage: error.message,
  // );
  // }
  // },
  // );
  // }
}
