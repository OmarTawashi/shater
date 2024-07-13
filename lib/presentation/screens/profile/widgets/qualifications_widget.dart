import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/profile/widgets/qualification_item_widget.dart';

import '../../../../util/color.dart';
import '../../base/text_custom.dart';

class QualificationsWidget extends StatelessWidget {
  const QualificationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 17.w),
      padding:
      EdgeInsetsDirectional.symmetric(vertical: 10.h, horizontal: 25.w).copyWith(end: 10.w),
      decoration: BoxDecoration(
          color: COLORS.strokeColor,
          borderRadius: BorderRadius.circular(13.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'qualifications'.tr,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 22.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),

                QualificationItemWidget(
                  qualification: "لديه شهادة في التعليم",
                ),
                QualificationItemWidget(
                  qualification: "خبير تربوي في مجال صعوبات التعلم",
                ),
                QualificationItemWidget(
                  qualification: "سنوات خبرة",
                  isYearsCount: true,
                  yearsCount: 3,
                ),
                // controller.profileData.
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 25.sp,
          ),
        ],
      ),
    );
  }
}