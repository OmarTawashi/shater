import 'package:flutter/material.dart';
import 'package:shater/util/color.dart';

class CustomIntikeContainer extends StatelessWidget {
  final Widget? child;
  final double paddingHorizontal;
  const CustomIntikeContainer(
      {super.key, this.child, this.paddingHorizontal = 16});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding:
          EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: 16),
      decoration: BoxDecoration(
          color: COLORS.backGroundColor,
          borderRadius: BorderRadius.circular(32)),
      child: Center(
        child: child,
      ),
    );
  }
}
