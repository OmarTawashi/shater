import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/widget/header_question_section.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/widget/image_question_section.dart';
import 'package:shater/util/dimensions.dart';

class TrueOrFalse extends StatelessWidget {
  final QuestionController? controller;
  TrueOrFalse({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderQuestionSection(
          titleQuestion: controller?.questionPage
                  ?.questions?[controller!.questionIndex]?.title ??
              '',
          subTitleQuestion: controller?.questionPage
                  ?.questions?[controller!.questionIndex]?.titleExtra ??
              '',
        ),
        ImageQuestionSection(
            media: controller
                ?.questionPage?.questions?[controller!.questionIndex]?.media,
            url: controller?.questionPage?.questions?[controller!.questionIndex]
                ?.questionMedia),
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
                  isSelect: controller?.selectAnswer == 'true',
                  icon: Icons.check_sharp,
                  onTap: () {
                    controller?.setAnswer('true');
                  },
                ),
              ),
              Expanded(
                child: WidgetTrueOrFalseTap(
                  isSelect: controller?.selectAnswer == 'false',
                  icon: Icons.close_sharp,
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
  WidgetTrueOrFalseTap(
      {super.key, this.onTap, this.isSelect = false, this.icon});
  final unSelectColor = Color.fromRGBO(228, 228, 228, 1);
  final selectColor = Color.fromRGBO(3, 90, 154, 1);

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
                width: 8, color: isSelect ? selectColor : unSelectColor)),
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
