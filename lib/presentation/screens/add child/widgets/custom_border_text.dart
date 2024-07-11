import 'package:flutter/material.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class CustomBorderText extends StatelessWidget {
  final double? radius;
  final Widget? child;
  final double? horizontalPadding;
  final double horizontalMargin;
  const CustomBorderText(
      {super.key,
      this.horizontalPadding,
      this.child,
      this.radius,
      this.horizontalMargin = Dimensions.paddingSize16});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 16,
            vertical: Dimensions.paddingSize12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 8),
            border: Border.all(
              color: COLORS.strokeColor,
              width: 1.8,
            ),
            color: Colors.transparent),
        child: child);
  }
}