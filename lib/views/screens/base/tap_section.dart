import 'package:flutter/material.dart';
import 'package:shater/views/screens/base/text_custom.dart';

import '../../../util/color.dart';

class TapSection extends StatelessWidget {
  final Function()? onTap;
  final bool? isSelected;
  final String? text;
  const TapSection({super.key, this.isSelected, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding:const EdgeInsets.all(11),
          margin:const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: isSelected ?? false
                  ? COLORS.secanderyColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(80)),
          child: CustomText(
            text: text ?? '',
            textAlign: TextAlign.center,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
