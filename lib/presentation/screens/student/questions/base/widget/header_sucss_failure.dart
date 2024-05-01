import 'package:flutter/material.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/dimensions.dart';

class SuccssOrFailureHeader extends StatelessWidget {
  final QuestionController? controller;
  const SuccssOrFailureHeader({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(Dimensions.paddingSize16,
                Dimensions.paddingSize16, Dimensions.paddingSize16, 0),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: controller?.questionStatus.getBgButtColor(),
                borderRadius: BorderRadius.circular(8)),
            child: CustomText(
              text: controller?.questionStatus.getTextStatus() ?? '',
              textAlign: TextAlign.center,
              fontSize: Dimensions.fontSize18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              maxLine: 1,
            ),
          ),
        )
      ],
    );
  }
}
