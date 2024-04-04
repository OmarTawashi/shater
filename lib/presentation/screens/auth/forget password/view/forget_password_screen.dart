import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/forget%20password/controller/forget_password_controller.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/circle_logo_app.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/custom_intike_container.dart';
import 'package:shater/presentation/screens/base/custom_text_form_field.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
      ),
      body: GetBuilder<ForgetPasswordController>(
        builder: (controller) => SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize16),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomIntikeContainer(
                        paddingHorizontal: 70,
                        child: CustomText(
                          text: 'forget_password',
                          textAlign: TextAlign.center,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: Dimensions.fontSize15,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSize25),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: Dimensions.paddingSize25,
                        ),
                        CircleLogoApp(),
                        SizedBox(
                          height: Dimensions.paddingSize80,
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
                          height: Dimensions.paddingSize20,
                        ),
                        CustomCupertinoButton(
                          text: 'forget_password',
                          isLoading: controller.isloading,
                          onPressed: controller.isEnable
                              ? () {
                                  // Get.toNamed(Routes.getDashBoardScreen());
                                  _submit(controller);
                                }
                              : null,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit(ForgetPasswordController controller) {
    final isValid = formKey.currentState?.validate();
    if (isValid!) {
      formKey.currentState?.save();
      controller.forgetPassword();
    }
  }
}
