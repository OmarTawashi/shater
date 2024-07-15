import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/util/color.dart';

class TrueOrFalseQuastion extends StatelessWidget {
  const TrueOrFalseQuastion({
    super.key,
    this.isSelected,
  });
  final isSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            debugPrint(" Make it true ////////////////");
          },
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor:
                isSelected ? COLORS.primaryColor : COLORS.hintColor,
            child: Center(
              child: Icon(
                Icons.check,
                size: 50,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            debugPrint(" Make it true ////////////////");
          },
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor:
                !isSelected ? COLORS.primaryColor : COLORS.hintColor,
            child: Center(
              child: Icon(
                Icons.cancel_outlined,
                size: 50,
                color: !isSelected ? COLORS.primaryColor : COLORS.hintColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
