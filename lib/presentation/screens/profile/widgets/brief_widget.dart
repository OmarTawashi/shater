import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/profile/widgets/qualification_item_widget.dart';

import '../../../../util/color.dart';
import '../../base/text_custom.dart';

class BriefWidget extends StatelessWidget {
  const BriefWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 17.w),
      padding:
      EdgeInsetsDirectional.symmetric(vertical: 10.h, horizontal: 25.w).copyWith(end: 18.w),
      decoration: BoxDecoration(
          color: COLORS.strokeColor,
          borderRadius: BorderRadius.circular(13.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText(
                text: 'brief'.tr,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22.sp,
              ),
              Spacer(),
              Icon(
                Icons.edit,
                color: Colors.white,
                size: 25.sp,
              ),
            ],
          ),
          SizedBox(
            height:5.h,
          ),
          CustomText(
            text: 'استطيع تدريس النهج لاولادكم بشكل احترافي وممتاز فلدي خبرة تجاوزت 3سنوات في تدريس المراحل الأولى و ايصال المعلومة بشكل مشوق ',
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16.sp,
          ),
          // controller.profileData.
        ],
      ),
    );
  }
}