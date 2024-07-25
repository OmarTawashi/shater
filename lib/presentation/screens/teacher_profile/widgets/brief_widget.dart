import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';

import '../../../../util/color.dart';
import '../../base/text_custom.dart';
import '../../teacher/about/about_teacher_screen.dart';

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
              GestureDetector(
                onTap: (){
                  Get.to(()=>AboutTeacherScreen());
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 25.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height:5.h,
          ),
          CustomText(
            text: Get.find<ProfileController>().profileData?.about ?? '',
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