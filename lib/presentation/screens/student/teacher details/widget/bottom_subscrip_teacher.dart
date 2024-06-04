import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class BottomSubScripTeacherWidget extends StatelessWidget {
  const BottomSubScripTeacherWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: COLORS.backGroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    gradient: COLORS.gradientContainer,
                    borderRadius: BorderRadius.circular(8)),
                child: CustomText(
                  text: '7.500' '\t' + 'د ك',
                  color: Colors.white,
                  fontSize: Dimensions.fontSize18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: Dimensions.paddingSize12,
              ),
              CustomText(
                text: 'شهريا ينتهي في' '/' '23/3/2024',
                color: Colors.white,
                fontSize: Dimensions.fontSize16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.fontSize10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: COLORS.gradientContainer),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'اشترك مع هذا المعلم',
                      fontSize: Dimensions.fontSize16,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
