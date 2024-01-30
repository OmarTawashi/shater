import 'package:flutter/material.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class FontStyleConstant {
  static String familyFont = 'HelveticaNeueLTArabic';
  

  static TextStyle hNLTRegular = TextStyle(
    fontFamily: familyFont,
    fontWeight: FontWeight.w400,
    fontSize: Dimensions.fontSize14,
    color: COLORS.textColor
  );
  static TextStyle hNLTBMedium = TextStyle(
    fontFamily: familyFont,
    fontWeight: FontWeight.w500,
    fontSize: Dimensions.fontSize14,
    color: COLORS.textColor
  );
  static TextStyle hNLTBBold = TextStyle(
    fontFamily: familyFont,
    fontWeight: FontWeight.w700,
    fontSize: Dimensions.fontSize14,
    color: COLORS.textColor
  );
  static TextStyle hNLTBBlack = TextStyle(
    fontFamily: familyFont,
    fontWeight: FontWeight.w900,
    fontSize: Dimensions.fontSize14,
    color: COLORS.textColor
  );
  static TextStyle hNLTSemiBold = TextStyle(
    fontFamily: familyFont,
    fontWeight: FontWeight.w600,
    fontSize: Dimensions.fontSize14,
    color: COLORS.textColor
  );
}
