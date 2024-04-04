import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/util/color.dart';

import '../../../util/font_style.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? textHeight;
  final FontWeight fontWeight;
  final Color color;
  final Color? bgColor;
  final TextAlign textAlign;
  final TextOverflow? overFlow;
  final int? maxLine;
  final TextDecoration? textDecoration;

 const CustomText({
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color = COLORS.primaryColor,
    this.bgColor,
    this.textAlign = TextAlign.start,
    this.textHeight = 1,
    this.overFlow,
    this.maxLine,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: FontStyleConstant.hNLTRegular.copyWith(
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
        color: color,
        height: textHeight,
        backgroundColor: bgColor,
        decoration: textDecoration,
        
      ),
      textAlign: textAlign,
      overflow: overFlow,
      maxLines: maxLine,
    );
  }
}
