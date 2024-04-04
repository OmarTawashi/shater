import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/sign%20in/controller/sign_in_controller.dart';
import 'package:shater/presentation/screens/base/custom_intike_container.dart';
import 'package:shater/presentation/screens/base/custom_text_form_field.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/routes/app_routes.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/button_back.dart';
import '../../../base/custom_cupertino_button.dart';
import '../../../base/text_not_acounts.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: const ButtonBack(),
      ),
      body: GetBuilder<SignInController>(
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
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.getTakeImageScreen());
                        },
                        child: CustomIntikeContainer(
                          paddingHorizontal: 70,
                          child: CustomText(
                            text: 'enter_acounts',
                            textAlign: TextAlign.center,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSize15,
                          ),
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
                    onChanged: (value) {
                      // controller.checkEmail();
                      controller.validEmail(value);
                    },
                    textValidation: 'please_enter_email'.tr,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    controller: controller.passwordController,
                    hintText: 'password'.tr,
                    obscureText: controller.isHide,
                    keyboardType: TextInputType.visiblePassword,
                    textValidation: 'please_enter_password'.tr,
                    suffix: visibleSecure(controller),
                    onChanged: (value) {
                      controller.validPassword(value);
                    },
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  CustomCupertinoButton(
                    text: 'enter',
                    isLoading: controller.isloading,
                    onPressed: controller.isEnable
                        ? () {
                            // Get.toNamed(Routes.getDashBoardScreen());
                            _submit(controller);
                          }
                        : null,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.toNamed(Routes.getForgetPasswordScreen());
                          },
                          child: const CustomText(
                            text: 'forget_passwords',
                            color: Color.fromRGBO(159, 191, 216, 1),
                            fontSize: Dimensions.fontSize15,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Divider(
                          color: COLORS.strokeColor,
                          thickness: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: CustomText(
                          text: 'or',
                          color: Color.fromRGBO(159, 191, 216, 1),
                          fontSize: Dimensions.fontSize15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: COLORS.strokeColor,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSize16,
                  ),
                  TextNotAcount(
                    startText: 'have_an_account',
                    lastText: 'create_new_acounts',
                    onTap: () {
                      Get.toNamed(Routes.getSignUpScreen());
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

  GestureDetector visibleSecure(SignInController controller) {
    return GestureDetector(
      onTap: () {
        controller.changeHide();
      },
      child: controller.isHide
          ? const Icon(
              Icons.visibility_off_sharp,
            )
          : const Icon(
              Icons.visibility_sharp,
            ),
    );
  }

  void _submit(SignInController controller) {
    final isValid = formKey.currentState?.validate();
    if (isValid!) {
      formKey.currentState?.save();
      controller.signInWithEmailPassword();
    }
  }
}
