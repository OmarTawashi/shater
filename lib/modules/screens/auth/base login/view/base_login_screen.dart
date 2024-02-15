import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/modules/screens/base/svgpicture_custom.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.getEditProfileScreen());
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const CustomSvgPicture(assetName: ICONS.logoAppt),
              ),
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
              onTap: () {},
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
                print('');
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
                print('');
              },
            ),
          ],
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
