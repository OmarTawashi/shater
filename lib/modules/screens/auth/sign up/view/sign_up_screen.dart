import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/button_back.dart';
import '../../../base/custom_cupertino_button.dart';
import '../../../base/custom_intike_container.dart';
import '../../../base/custom_text_form_field.dart';
import '../../../base/text_custom.dart';
import '../../../base/text_not_acounts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: const ButtonBack(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      text: 'create_new_acount_student',
                      textAlign: TextAlign.center,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'email'.tr,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'enter_password'.tr,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'retry_enter_password'.tr,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                children: [
                  Checkbox.adaptive(
                    value: false,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fillColor: MaterialStatePropertyAll(Colors.transparent),
                    activeColor: Colors.amber,
                    side: BorderSide(color: Colors.white, width: 1.5),
                    checkColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    onChanged: (value) {},
                  ),
                  TextNotAcount(
                    startText: 'ok_to',
                    lastText: 'privcy_policy',
                    mainAxisAlignment: MainAxisAlignment.start,
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              CustomCupertinoButton(
                text: 'next',
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
    );
  }
}
