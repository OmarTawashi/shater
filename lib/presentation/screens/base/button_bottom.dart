import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';

class ButtonBottom extends StatelessWidget {
  final Function()? onTap;
  final bool isLoading;

  const ButtonBottom({super.key, this.onTap, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        decoration: BoxDecoration(
          color: COLORS.backGroundColor,
        ),
        child: isLoading
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 175.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle
                ),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : CustomText(
                text: 'next',
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
