import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/util/color.dart';

// ignore: must_be_immutable
class CustomeButton extends StatelessWidget {
  CustomeButton({
    Key? key,
    required this.title,
    required this.onClick,
    this.fontSize,
    this.width,
    this.height,
    this.radius,
    this.backgroundColor,
    this.borderRadius,
    this.borderwidth,
    this.textStyle,
  }) : super(key: key);
  final String title;
  final Function() onClick;
  double? fontSize;
  double? height;
  double? width;
  double? radius;
  Color? backgroundColor;
  double? borderwidth;
  double? borderRadius;
TextStyle ?textStyle;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
    width: width ?? 300.w,
        height: height ?? 50.h,
      ),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor ?? Colors.black,
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              border: Border.all(
                  color: COLORS.backGroundColor, width: borderwidth ?? 0)),
          child: Text(
            title,
            style: textStyle??
            TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
