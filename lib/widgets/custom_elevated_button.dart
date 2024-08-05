import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/color.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    super.key,
    this.onTap,
    this.title = '',
    this.child = null,
    this.backGround_Color = COLORS.primaryColor,
    this.Border_Color,
    this.width = double.infinity,
    this.height = 51,
    this.borderRadius = 26,
    this.textStyle,
  });
  String? title;
  Function()? onTap;
  TextStyle? textStyle;
  late Widget? child;
  late Color backGround_Color;
  late Color? Border_Color;
  late double width;
  late double height;
  late double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGround_Color,
        fixedSize: Size(width.w, height.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        shadowColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColorDark,
      ),
      onPressed: onTap,
      child: child ??
          Text(
            title ?? '',
            style: textStyle ?? TextStyle(color: COLORS.whiteColor),
          ),
    );
  }
}
