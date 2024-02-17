import 'package:flutter/material.dart';

import '../../../util/color.dart';
import '../../../util/dimensions.dart';
import '../../../util/font_style.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? textValidation;
  final bool? enabledField;
  final Function(String)? onChanged;
  final Widget? suffix;
  final bool obscureText;
  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.controller,
      this.onChanged,
      this.enabledField = true,
      this.keyboardType,
      this.obscureText = false,
      this.suffix,
      this.textValidation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged:onChanged ,
      obscureText:obscureText ,
      textAlign: TextAlign.center,
      cursorColor: Colors.white,
      style: FontStyleConstant.hNLTRegular.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: Dimensions.fontSize15,
      ),
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
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: COLORS.strokeColor, width: 2)),
        contentPadding: const EdgeInsets.all(14),
        filled: true,
        fillColor: Colors.transparent,
        hintText: hintText,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: const BorderSide(color: COLORS.strokeColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: COLORS.strokeColor, width: 2)),
        hintStyle: FontStyleConstant.hNLTRegular.copyWith(
          color: Color.fromRGBO(159, 191, 216, 1),
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSize15,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 10, 12, 14), width: 2)),
      ),
    );
  }
}
