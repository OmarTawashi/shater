
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/routes/app_routes.dart';

import '../../../../util/color.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/images.dart';
import '../../base/text_custom.dart';

class ItemExercise extends StatelessWidget {
  const ItemExercise({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  ICONS.book,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                width: Dimensions.paddingSize16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomText(
                      text: 'رياضيات',
                      color: Colors.white,
                      fontSize: Dimensions.fontSize18,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: Dimensions.paddingSize20,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Dimensions.paddingSize12, vertical: Dimensions.paddingSize8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(16)),
                        child: CustomText(
                          text:'243''\t'  + 'trainning'.tr ,
                          color: COLORS.secanderyColor,
                          fontSize: Dimensions.fontSize12,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.getExerciseDetailsScreen());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: COLORS.primaryColor),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'exercied',
                        color: Colors.white,
                        textAlign: TextAlign.start,
                        fontSize: Dimensions.fontSize13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        width: Dimensions.paddingSize10,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: COLORS.primaryColor.withOpacity(0.15),
            height: 10,
            thickness: 1.5,
            endIndent: 80.w,
            indent: 8,
          )
        ],
      ),
    );
  }
}
