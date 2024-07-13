import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base/text_custom.dart';

class QualificationItemWidget extends StatelessWidget {
  QualificationItemWidget({
    super.key,
    required this.qualification,
    this.isYearsCount = false,
    this.yearsCount = 0,
  });

  final String qualification;
  final bool isYearsCount;
  final int yearsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 27.w,
          height: 27.h,
          margin: EdgeInsetsDirectional.only(bottom: 10.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xff00DE00),
            shape: BoxShape.circle,
          ),
          child: isYearsCount
              ? CustomText(
                  text: "$yearsCount",
                  textAlign: TextAlign.center,
                  // textHeight: 17.h,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 15.sp,
                )
              : Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18.sp,
                ),
        ),
        SizedBox(
          width: 10.w,
        ),
        CustomText(
          text: qualification,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 17.sp,
        ),
      ],
    );
  }
}
