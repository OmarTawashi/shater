import 'package:flutter/material.dart';
import 'package:shater/util/color.dart';

import '../../../../../util/dimensions.dart';
import '../../../base/text_custom.dart';

class ItemCity extends StatelessWidget {
  final String? name;
  final Function()? onTap;
  final bool isSelect;
  const ItemCity({
    super.key,
    this.name,
    this.onTap,
    this.isSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
            bottom: Dimensions.paddingSize16, left: 35, right: 35),
        padding: EdgeInsets.symmetric(
          vertical: 18,
        ),
        decoration: BoxDecoration(
            color: isSelect ? Colors.white : COLORS.secanderyColor,
            borderRadius: BorderRadius.circular(50)),
        child: CustomText(
          text: name ?? '',
          color: isSelect ? COLORS.primaryColor : Colors.white,
          fontSize: Dimensions.fontSize18,
          maxLine: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
