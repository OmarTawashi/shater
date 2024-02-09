import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/views/screens/auth/base%20login/view/base_login_screen.dart';

import '../../../../util/color.dart';
import '../../../../util/dimensions.dart';
import '../../base/custom_intike_container.dart';
import '../../base/text_custom.dart';
import '../../edit profile/view/edit_profile_screen.dart';

class SemesterScreen extends StatelessWidget {
  const SemesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
          backgroundColor: COLORS.primaryColor,
          automaticallyImplyLeading: false,
          leadingWidth: 120,
          toolbarHeight: 65,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const CustomIntikeContainer(
              paddingHorizontal: Dimensions.paddingSize12,
              child: CustomText(
                text: 'cancel',
                color: Colors.white,
                fontSize: Dimensions.fontSize14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: const [
            CustomBorderText(
              horizontalPadding: Dimensions.paddingSize25,
              child: CustomText(
                text: 'save',
                color: COLORS.strokeColor,
                fontSize: Dimensions.fontSize14,
                fontWeight: FontWeight.bold,
              ),
              radius: 32,
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const  Padding(
              padding:  EdgeInsets.only(bottom:  90.0),
              child:  CustomText(
                text: "select_the_semester", //'soon'
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSize16,
              ),
            ),
            
            ButtonBorderFillWidget(
              onTap: () {},
              borderColor: COLORS.strokeColor,
              isShowIcon: false,
              text: 'season_one',
              backgroundColor: Colors.transparent,
              textColor: const Color.fromRGBO(159, 191, 216, 1),
            ),
            const SizedBox(
              height: Dimensions.paddingSize16,
            ),
            ButtonBorderFillWidget(
              onTap: () {},
              isShowIcon: false,
              text: 'season_two',
              backgroundColor: COLORS.secanderyColor,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 80.h,
            )
          ],
        ),
      ),
    );
  }
}
