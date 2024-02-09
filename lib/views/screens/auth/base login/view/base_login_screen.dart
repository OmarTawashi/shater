import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';
import 'package:shater/views/screens/base/svgpicture_custom.dart';

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
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.getSignInScreen());
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: COLORS.strokeColor, width: 2)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomText(
                        text: 'enter_acounts',
                        textHeight: 1,
                        textAlign: TextAlign.center,
                        color: Color.fromRGBO(159, 191, 216, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSize15,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 18,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            TextNotAcount(
              startText: 'have_an_account',
              lastText: 'create_new_acounts',
              isShowIcon: false,
              mainAxisAlignment:  MainAxisAlignment.start,
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
