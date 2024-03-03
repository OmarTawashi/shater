import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(50, 0, 50, 50),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(color: COLORS.backGroundColor),
        child: CustomText(
          text: 'use',
          fontSize: Dimensions.fontSize14,
          textAlign: TextAlign.center,
          color: Colors.white,
          fontWeight: FontWeight.bold,
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
            return Image.asset(
                'assets/${controller.typeAvatar}/${index + 1}.png');
          },
        ),
      ),
    );
  }
}
