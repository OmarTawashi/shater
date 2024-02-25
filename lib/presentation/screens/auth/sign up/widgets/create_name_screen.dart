import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/circle_logo_app.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/custom_text_form_field.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class CreateNameScreen extends StatelessWidget {
  CreateNameScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
      ),
      body: GetBuilder<SignUpController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Stack(alignment: Alignment.center, children: [
                Column(
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
                      controller: controller.nameController,
                      hintText: 'your_name'.tr,
                      keyboardType: TextInputType.name,
                      textValidation: 'please_enter_name'.tr,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        controller.validName(value);
                      },
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize25,
                    ),
                    CustomCupertinoButton(
                        text: 'create_account',
                        onPressed: controller.isValidName
                            ? () {
                                _submit(controller);
                              }
                            : null)
                  ],
                ),
                controller.isloading
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 90),
                        padding: EdgeInsets.all(50),
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: COLORS.secanderyColor,
                          strokeWidth: 3.5,
                        )),
                      )
                    : SizedBox()
              ]),
            ),
          ),
        ),
      ),
    );
  }

  void _submit(SignUpController controller) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      controller.registerWithEmailPassword();
    }
  }
}
