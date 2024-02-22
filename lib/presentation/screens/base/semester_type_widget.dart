import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';

import '../../../routes/app_routes.dart';

class SemesterTypeWidget extends StatelessWidget {
  final String? semester;
  const SemesterTypeWidget({super.key, this.semester});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.getSemesterScreen());
      },
      child: Container(
        margin:
            const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize16,
            vertical: Dimensions.paddingSize8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromRGBO(72, 131, 196, 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: semester ?? "",
              color: Colors.white,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.fontSize12 ,
            )
          ],
        ),
      ),
    );
  }
}
