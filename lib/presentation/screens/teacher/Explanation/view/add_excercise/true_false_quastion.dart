import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/add_excercise/add_quastion_controller.dart';
import 'package:shater/util/color.dart';

class TrueOrFalseQuastion extends StatelessWidget {
  const TrueOrFalseQuastion({
    super.key,
    // this.isSelected,
  });
  // final isSelected;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddQuastionController>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              controller.updateSelectedAnswer();
              // controller.selectedAnswer=true;
              debugPrint(" Make it true ////////////////");
            },
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: controller.selectedAnswer
                  ? COLORS.primaryColor
                  : COLORS.hintColor,
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
              controller.updateSelectedAnswer();
              // controller.selectedAnswer=false;
              debugPrint(" Make it False ////////////////");
            },
            child: CircleAvatar(
              radius: 50.r,
              backgroundColor: !controller.selectedAnswer
                  ? COLORS.primaryColor
                  : COLORS.hintColor,
              child: Center(
                child: Icon(
                  Icons.cancel_outlined,
                  size: 50,
                  color: !controller.selectedAnswer
                      ? COLORS.primaryColor
                      : COLORS.hintColor,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
