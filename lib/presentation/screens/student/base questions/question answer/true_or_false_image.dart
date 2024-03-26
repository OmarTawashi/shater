import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/dimensions.dart';

class TrueOrFalseImage extends StatelessWidget {
  final QuestionController? controller;
  TrueOrFalseImage({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
          child: Row(
            children: [
              Expanded(
                child: WidgetTrueOrFalseTap(
                  isSelect: controller?.selectAnswer.contains('true') ?? false,
                  icon: Icons.check_sharp,
                  selectColor: controller?.questionStatus.getBgButtColor(),
                  onTap: () {
                    controller?.setAnswer('true');
                  },
                ),
              ),
              Expanded(
                child: WidgetTrueOrFalseTap(
                  isSelect: controller?.selectAnswer.contains('false') ?? false,
                  icon: Icons.close_sharp,
                  selectColor: controller?.questionStatus.getBgButtColor(),
                  onTap: () {
                    controller?.setAnswer('false');
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class WidgetTrueOrFalseTap extends StatelessWidget {
  final Function()? onTap;
  final bool isSelect;
  final IconData? icon;
  final Color? selectColor;
  WidgetTrueOrFalseTap(
      {super.key,
      this.onTap,
      this.selectColor,
      this.isSelect = false,
      this.icon});
  final unSelectColor = Color.fromRGBO(228, 228, 228, 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelect ? selectColor : Colors.transparent,
            border: Border.all(
                width: 5, color: isSelect ? selectColor! : unSelectColor)),
        child: Icon(
          icon,
          color: isSelect ? Colors.white : unSelectColor,
          weight: 40,
          size: 50,
        ),
      ),
    );
  }
}
