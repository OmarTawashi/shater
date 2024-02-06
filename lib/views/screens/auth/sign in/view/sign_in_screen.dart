import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/views/screens/base/custom_intike_container.dart';
import 'package:shater/views/screens/base/custom_text_form_field.dart';
import 'package:shater/views/screens/base/text_custom.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/button_back.dart';
import '../../../base/custom_cupertino_button.dart';

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
                hintText: 'password'.tr,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: 22,
              ),
              CustomCupertinoButton(
                text: 'enter',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'have_an_account'.tr + '\t',
                    color: const Color.fromRGBO(159, 191, 216, 1),
                    fontSize: Dimensions.fontSize14,
                    fontWeight: FontWeight.w400,
                  ),
                  InkWell(
                      onTap: () {},
                      child: const CustomText(
                        text: 'create_new_acounts',
                        color: Color.fromRGBO(0, 207, 254, 1),
                        fontSize: Dimensions.fontSize14,
                        fontWeight: FontWeight.w400,
                      )),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                    size: 18,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
