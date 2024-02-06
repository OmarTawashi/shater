
import 'package:flutter/material.dart';

import '../../../../util/color.dart';
import '../../base/text_custom.dart';

class IntikTextTop extends StatelessWidget {
  final String text;
  const IntikTextTop({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
      decoration: BoxDecoration(
          color: COLORS.primaryColor, borderRadius: BorderRadius.circular(18)),
      child: CustomText(
        text: text,
        textAlign: TextAlign.center,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
