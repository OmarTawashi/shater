import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/util/constant.dart';

import '../../../util/color.dart';
import '../../../util/dimensions.dart';
import '../../../util/font_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextAlign? textAlign;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final String? textValidation;
  final bool? enabledField;
  final Function(String)? onChanged;
  final Widget? suffix,prefix;
  final bool obscureText;
  final bool filled;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? cursorColor;
  final double? textSize;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.style,
      this.hintStyle,
      this.textColor,
      this.cursorColor,
      this.textSize,
      this.borderRadius,
      this.borderColor,
      this.fillColor,
      this.textAlign,
      this.controller,
      this.onChanged,
      this.enabledField = true,
      this.filled = true,
      this.keyboardType,
      this.obscureText = false,
      this.suffix,
      this.prefix,
      this.maxLines,
      this.contentPadding,
      this.textInputAction,
      this.textValidation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      keyboardType: keyboardType,
      textDirection: TextDirection.rtl,
      onChanged: onChanged,
      textInputAction:textInputAction ,
      obscureText: obscureText,
      textAlign: textAlign ?? TextAlign.center,
      cursorColor: cursorColor ?? Colors.white,
      style: style ?? FontStyleConstant.hNLTRegular.copyWith(
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: textSize ?? Dimensions.fontSize15,
          locale: Locale(APPCONSTANT.languages[1].languageCode ?? '',
              APPCONSTANT.languages[0].languageCode)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return textValidation;
        }

        return null;
      },
      decoration: InputDecoration(
        enabled: enabledField!,
        alignLabelWithHint: true,
        suffixIcon: suffix,
        suffixIconColor: COLORS.secanderyColor,
        prefixIcon: prefix,
        prefixIconColor: COLORS.secanderyColor,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 13),
            borderSide: BorderSide(color: borderColor ?? COLORS.strokeColor, width: 2)),
        contentPadding: contentPadding ??  EdgeInsets.symmetric(horizontal: 14.w,vertical: 14.h),
        filled: filled,
        fillColor: fillColor ?? Colors.transparent,
        hintText: hintText,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 13),
          borderSide: BorderSide(color: borderColor ?? COLORS.strokeColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 13),
            borderSide: BorderSide(color: borderColor ?? COLORS.strokeColor, width: 2)),
        hintStyle: hintStyle ?? FontStyleConstant.hNLTRegular.copyWith(
          color: Color.fromRGBO(159, 191, 216, 1),
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSize15,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 13),
            borderSide: BorderSide(
                color: borderColor ?? Color.fromARGB(255, 10, 12, 14), width: 2)),
      ),
    );
  }
}
