import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/sign%20in/widgets/item_childern.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/take%20image/controller/take_image_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class TakeImageScreen extends StatelessWidget {
  const TakeImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
          backgroundColor: COLORS.primaryColor,
          leadingWidth: 200,
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomText(
                text: 'skip',
                fontSize: Dimensions.fontSize14,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
      body: GetBuilder<TakeImageController>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: Dimensions.paddingSize25,
            ),
            CustomText(
              text: 'add_image_to_profile',
              fontSize: Dimensions.fontSize15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: Dimensions.paddingSize25 + 10,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: COLORS.backGroundColor, shape: BoxShape.circle),
              child: Image.asset(
                IMAGES.logoApp,
                color: COLORS.primaryColor,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            CustomText(
              text: 'or_use_image_avatar',
              fontSize: Dimensions.fontSize15,
              color: COLORS.secanderyColor,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: Dimensions.paddingSize25 + 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ItemChildern(
                  onTap: () {
                    controller.setTypeAvatar('male');
                    Get.toNamed(Routes.getGridViewAvatar());
                  },
                  image: 'assets/male/10.png',
                  title: 'male',
                ),
                ItemChildern(
                  onTap: () {
                    controller.setTypeAvatar('female');
                    Get.toNamed(Routes.getGridViewAvatar());
                  },
                  image: 'assets/female/8.png',
                  title: 'female',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
