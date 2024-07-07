import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/util/color.dart';

// ignore: must_be_immutable
class CustomeTextField extends StatefulWidget {
  const CustomeTextField(
      {super.key,
      this.hintText,
      required this.textController,
      required this.keyboardType,
      this.validate,
      this.errorText,
      this.maxLines,
      this.minLines,
      this.prefixIcon,
      this.suffixIcon,
      this.label,
      this.onChanged,
      this.obscureText = false});
  final TextEditingController textController;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String? text)? validate;
  final void Function(dynamic value)? onChanged;
  final String? errorText;
  final Widget? suffixIcon;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final Widget? label;
  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      textAlign: TextAlign.start,
      keyboardType: widget.keyboardType,
      controller: widget.textController,
      onChanged: widget.onChanged,
      textDirection: TextDirection.rtl,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(
          maxHeight: 60.h,
          minHeight: 60.h,
        ),
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffixIcon,
        hintStyle: TextStyle(
          color: COLORS.textLightColor,
          fontSize: 14.sp,
        ),
        errorText: widget.errorText,
        contentPadding: EdgeInsetsDirectional.only(start: 10.h, top: 20.h),
        errorStyle: const TextStyle(fontSize: 10),
        hintText: widget.hintText ?? "",
        filled: true,
        fillColor: Colors.white70,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          gapPadding: 0.1,
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      validator: (text) {
        if (text!.isEmpty) {
          return "Field is required";
        } else {
          return null;
        }
      },
    );
  }
}
