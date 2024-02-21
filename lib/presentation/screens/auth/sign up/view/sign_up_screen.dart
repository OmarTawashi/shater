import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';

import '../../../../../core/base/base_mixin.dart';
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIntikeContainer(
                        paddingHorizontal: 21,
                        child: CustomText(
                          text: 'create_new_acount_student',
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
                    onChanged: (p0) {},
                    textValidation: 'please_enter_password'.tr,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSize5,
                  ),
                  Visibility(
                    visible: controller.passwordController.text !=
                        controller.againPasswordController.text,
                    child: CustomText(
                      text: 'please_enter_the_same_password',
                      color: COLORS.secanderyColor,
                      fontWeight: FontWeight.w400,
                      fontSize: Dimensions.fontSize14,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Checkbox.adaptive(
                        value: controller.isAgree,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fillColor:
                            const MaterialStatePropertyAll(Colors.transparent),
                        activeColor: Colors.amber,
                        side: const BorderSide(color: Colors.white, width: 1.5),
                        checkColor: COLORS.secanderyColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side:
                              const BorderSide(color: Colors.white, width: 1.5),
                        ),
                        onChanged: (value) {
                          controller.changeAgree(value ?? false);
                        },
                      ),
                      TextNotAcount(
                        startText: 'ok_to',
                        lastText: 'privcy_policy',
                        mainAxisAlignment: MainAxisAlignment.start,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomCupertinoButton(
                    text: 'next',
                    onPressed: controller.isEnable()
                        ? () => _submit(controller)
                        : null,
                  ),
                  const SizedBox(
                    height: Dimensions.paddingSize16,
                  ),
                  TextNotAcount(
                    startText: 'have_an_acount',
                    lastText: 'sign_in',
                    onTap: () {},
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
      if (controller.passwordController.text !=
          controller.againPasswordController.text) {
        BaseMixin.showToastFlutter(messsage: 'Passwords do not match');
      } else {
        if (controller.isAgree) {
          formKey.currentState!.save();
          controller.registerWithEmailPassword();
        } else {
          BaseMixin.showToastFlutter(
              messsage: 'Please agree to the terms and conditions');
        }
      }
    }
  }
}
