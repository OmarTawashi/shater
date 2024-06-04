import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';

class TapTeacherWidget extends StatelessWidget {
  final Function()? onTap;
  final bool isSelected;
  final String? text;
  const TapTeacherWidget(
      {super.key, this.onTap, this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: isSelected
                ? Color.fromRGBO(72, 131, 196, 1.0)
                : Colors.transparent,
            border: Border.all(
                color: Color.fromRGBO(72, 131, 196, 1.0), width: 2.5),
            borderRadius: BorderRadius.circular(13)),
        child: CustomText(
          text: text ?? '',
          color: Colors.white,
          textAlign: TextAlign.center,
          fontSize: Dimensions.fontSize18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
