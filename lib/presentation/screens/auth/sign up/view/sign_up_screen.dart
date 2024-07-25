import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/auth/base%20login/widgets/auth_mixin.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';
import 'package:shater/routes/app_routes.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/button_back.dart';
import '../../../base/custom_cupertino_button.dart';
import '../../../base/custom_intike_container.dart';
import '../../../base/custom_text_form_field.dart';
import '../../../base/text_custom.dart';
import '../../../base/text_not_acounts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: const ButtonBack(),
      ),
      body: GetBuilder<SignUpController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIntikeContainer(
                        paddingHorizontal: 21,
                        child: CustomText(
                          text: authController.userType.title,
                          textAlign: TextAlign.center,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSize15,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  CustomTextFormField(
                    controller: controller.emailController,
                    hintText: 'email'.tr,
                    keyboardType: TextInputType.emailAddress,
                    textValidation: 'please_enter_email'.tr,
                    onChanged: (value) {
                      controller.validEmail(value);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: controller.passwordController,
                    hintText: 'enter_password'.tr,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    // suffix: visibleSecure(controller),
                    onChanged: (value) {
                      controller.validPassword(value);
                    },
                    textValidation: 'please_enter_password'.tr,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: controller.againPasswordController,
                    hintText: 'retry_enter_password'.tr,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    // suffix: visibleSecure(controller),
                    onChanged: (value) {
                      controller.validAgainPassword(value);
                    },
                    textValidation: 'please_enter_password'.tr,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSize5,
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: controller.passwordController.text !=
                            controller.againPasswordController.text,
                        child: CustomText(
                          text: 'please_enter_the_same_password',
                          color: COLORS.secanderyColor,
                          fontWeight: FontWeight.w200,
                          fontSize: Dimensions.fontSize12,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.changeAgree();
                        },
                        child: Container(
                            width: 25,
                            height: 25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.circular(4)),
                            child: controller.isAgree
                                ? Icon(
                                    Icons.check,
                                    size: 17,
                                    color: Colors.white,
                                    weight: 6,
                                  )
                                : SizedBox()),
                      ),
                      SizedBox(
                        width: Dimensions.paddingSize5 + 1,
                      ),
                      TextNotAcount(
                        startText: 'ok_to',
                        lastText: 'privcy_policy',
                        mainAxisAlignment: MainAxisAlignment.start,
                        onTap: () {
                          Get.toNamed(Routes.getPrivcyPolicyScreen());
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomCupertinoButton(
                    text: 'next',
                    isLoading: controller.isLoadingCheck,
                    onPressed: controller.isEnable
                        ? () {
                            _submit(controller);
                          }
                        : null,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSize16,
                  ),
                  TextNotAcount(
                    startText: 'have_an_acount',
                    lastText: 'sign_in',
                    onTap: () {
                      if (Get.previousRoute == Routes.getSignInScreen()) {
                        Get.back();
                      } else {
                        Get.offNamed(Routes.getSignInScreen());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit(SignUpController controller) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      controller.checkEmail();
    }
  }
}
