import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/base%20login/controller/auth_controller.dart';
import 'package:shater/presentation/screens/base/circle_logo_app.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

import '../../../base/custom_cupertino_button.dart';
import '../../../base/text_custom.dart';
import '../../../base/text_not_acounts.dart';
import '../widgets/rate_app.dart';

class BaseLoginScreen extends StatelessWidget {
  const BaseLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
      ),
      body: GetBuilder<AuthController>(
        builder: (controller) => Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                onTap: () {
                  // Get.toNamed(Routes.getProfileScreen());
                },
                child: CircleLogoApp(),
              ),
              SizedBox(
                height: Dimensions.paddingSize20.h,
              ),
              RateApp(),
              SizedBox(
                height: 45.h,
              ),
              ButtonBorderFillWidget(
                onTap: () {
                  controller.changeAuthType(AuthType.student);
                  Get.toNamed(Routes.getSignInScreen());
                },
                borderColor: COLORS.strokeColor,
                isShowIcon: true,
                text: 'enter_acounts',
                backgroundColor: Colors.transparent,
                textColor: Color.fromRGBO(159, 191, 216, 1),
              ),
              SizedBox(
                height: 45.h,
              ),
              TextNotAcount(
                startText: 'have_an_account',
                lastText: 'create_new_acounts',
                isShowIcon: false,
                mainAxisAlignment: MainAxisAlignment.start,
                onTap: () {
                  controller.changeAuthType(AuthType.student);
                  Get.toNamed(Routes.getSignUpScreen());
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomCupertinoButton(
                assetName: ICONS.studentIC,
                text: 'teacher',
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {
                  controller.changeAuthType(AuthType.teacher);
                  Get.toNamed(Routes.getSignUpScreen());
                },
              ),
              const SizedBox(
                height: Dimensions.paddingSize16,
              ),
              CustomCupertinoButton(
                assetName: ICONS.student,
                text: 'student',
                trailing: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {
                  controller.changeAuthType(AuthType.student);
                  Get.toNamed(Routes.getSignUpScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonBorderFillWidget extends StatelessWidget {
  final Function()? onTap;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color textColor;
  final String? text;
  final bool isShowIcon;
  const ButtonBorderFillWidget(
      {super.key,
      this.onTap,
      this.borderColor,
      this.backgroundColor,
      this.text,
      this.isShowIcon = false,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: backgroundColor,
            border: borderColor != null
                ? Border.all(color: borderColor!, width: 2)
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CustomText(
                text: text ?? '',
                textHeight: 1,
                textAlign: TextAlign.center,
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSize15,
              ),
            ),
            isShowIcon
                ? Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 18,
                    color: Colors.white,
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
