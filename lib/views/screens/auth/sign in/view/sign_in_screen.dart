import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/views/screens/auth/sign%20in/controller/sign_in_controller.dart';
import 'package:shater/views/screens/base/custom_intike_container.dart';
import 'package:shater/views/screens/base/custom_text_form_field.dart';
import 'package:shater/views/screens/base/text_custom.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/button_back.dart';
import '../../../base/custom_cupertino_button.dart';
import '../../../base/text_not_acounts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
      ),
      body: GetBuilder<SignInController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIntikeContainer(
                      paddingHorizontal: 70,
                      child: CustomText(
                        text: 'enter_acounts',
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
                  onChanged: (value) {
                    controller.checkEmail(context);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hintText: 'password'.tr,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 22,
                ),
                CustomCupertinoButton(
                  text: 'enter',
                  onPressed: () {
                    Get.toNamed(Routes.getDashBoardScreen());
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: const CustomText(
                          text: 'forget_passwords',
                          color: Color.fromRGBO(159, 191, 216, 1),
                          fontSize: Dimensions.fontSize15,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ),
                SizedBox(
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
    );
  }
}
