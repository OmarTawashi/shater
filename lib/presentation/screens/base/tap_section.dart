import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';

import '../../../util/color.dart';

class TapSection extends StatelessWidget {
  final Function()? onTap;
  final bool? isSelected;
  final String? text;
  final Color? selectColor;
  final Color unSelectTextColor;
  const TapSection(
      {super.key,
      this.isSelected,
      this.selectColor = COLORS.secanderyColor,
      this.unSelectTextColor = Colors.white,
      this.onTap,
      this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: isSelected ?? false ? selectColor : Colors.transparent,
              borderRadius: BorderRadius.circular(80)),
          child: CustomText(
            text: text ?? '',
            textAlign: TextAlign.center,
            color: isSelected ?? false ? Colors.white : unSelectTextColor,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.fontSize16,
          ),
        ),
      ),
    );
  }
}
