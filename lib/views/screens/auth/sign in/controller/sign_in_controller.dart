import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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