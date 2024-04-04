import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/color.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: COLORS.backGroundColor,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
