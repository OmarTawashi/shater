import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/circle_logo_app.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/custom_text_form_field.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class CreateNameScreen extends StatelessWidget {
  const CreateNameScreen({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomText(
                text: 'welcome',
                fontSize: Dimensions.fontSize24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              SizedBox(
                height: Dimensions.paddingSize20,
              ),
              CircleLogoApp(),
              SizedBox(
                height: Dimensions.paddingSize20,
              ),
              CustomText(
                text: 'knew_name',
                fontSize: Dimensions.fontSize24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
              SizedBox(
                height: Dimensions.paddingSize20,
              ),
              CustomTextFormField(
                controller: TextEditingController(),
                hintText: 'your_name'.tr,
                keyboardType: TextInputType.emailAddress,
                textValidation: 'please_enter_name'.tr,
              ),
              SizedBox(
                height: Dimensions.paddingSize25,
              ),
              CustomCupertinoButton(
                text: 'create_account',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
