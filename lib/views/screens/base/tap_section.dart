import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/views/screens/base/text_custom.dart';

import '../../../util/color.dart';

class TapSection extends StatelessWidget {
  final Function()? onTap;
  final bool? isSelected;
  final String? text;
  const TapSection({super.key, this.isSelected, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(7.sp),
          margin: EdgeInsets.all(4.sp),
          decoration: BoxDecoration(
              color: isSelected ?? false
                  ? COLORS.secanderyColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(80)),
          child: CustomText(
            text: text ?? '',
            textAlign: TextAlign.center,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
