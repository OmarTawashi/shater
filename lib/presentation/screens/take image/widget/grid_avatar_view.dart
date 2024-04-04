import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/resgister/controller/register_controller.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/take%20image/controller/take_image_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class GridViewAvatar extends StatelessWidget {
  const GridViewAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
        centerTitle: true,
        title: CustomText(
          text: 'select_image_avatar_profile',
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      bottomNavigationBar: GetBuilder<TakeImageController>(
        builder: (controller) => GetBuilder<RegisterController>(
          builder: (registerController) => 
           GestureDetector(
            onTap: controller.imageAvatarSelect != null
                ? () {
                  registerController.getFunUserType(
                       registerController.authController.userType);
                  }
                : null,
            child: Container(
              margin: EdgeInsets.fromLTRB(50, 0, 50, 50),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(color: COLORS.backGroundColor),
              child: registerController.isloading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ))
                  : CustomText(
                      text: 'use',
                      fontSize: Dimensions.fontSize14,
                      textAlign: TextAlign.center,
                      color: controller.imageAvatarSelect != null
                          ? Colors.white
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
            ),
          ),
        ),
      ),
      body: GetBuilder<TakeImageController>(
        builder: (controller) => GridView.builder(
          padding: EdgeInsets.all(16),
          itemCount: 32,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.getImageAvatarToFile(
                    'assets/${controller.typeAvatar}/${index + 1}.png');
              },
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/${controller.typeAvatar}/${index + 1}.png'))),
                  child: controller.imageAvatarSelect ==
                          'assets/${controller.typeAvatar}/${index + 1}.png'
                      ? Icon(
                          Icons.check_sharp,
                          color: Colors.green,
                          size: 40,
                          weight: 20,
                        )
                      : SizedBox()),
            );
          },
        ),
      ),
    );
  }
}
