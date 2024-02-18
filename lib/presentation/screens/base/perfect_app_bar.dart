import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/modules/screens/base/custom_sliver_app_bar.dart';
import 'package:shater/modules/screens/base/text_custom.dart';
import 'package:shater/routes/app_routes.dart';

import '../../../util/dimensions.dart';

class PerfectAppBar extends StatelessWidget {
  const PerfectAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      leadingWidth: 116.w,
      pinned: true,
      primary: true,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin:
                EdgeInsets.symmetric(horizontal: Dimensions.paddingSize10.w),
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
          const CustomText(
            text: 'اسماء',
            color: Colors.white,
            fontSize: Dimensions.fontSize16 + 1,
          )
        ],
      ),
      actions: [
        GestureDetector(
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
                  text: 'season_one',
                  color: Colors.white,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize12 + 2.sp,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
