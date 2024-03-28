import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/dimensions.dart';

class HeaderFailureStatus extends StatelessWidget {
  final QuestionController? controller;
  const HeaderFailureStatus({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Dimensions.paddingSize16,
          Dimensions.paddingSize16, Dimensions.paddingSize16, 0),
      child: Row(
        children: [
          SelectTapFailure(
            text: 'show_explain',
            isSelect: controller?.failureTap == FailureEnum.showExpalin,
            onTap: () {
              controller?.changeFailuerTap(FailureEnum.showExpalin);
            },
          ),
          SizedBox(
            width: Dimensions.paddingSize16,
          ),
          SelectTapFailure(
            text: 'true',
            isSelect: controller?.failureTap == FailureEnum.trueAnswer,
            onTap: () {
              controller?.changeFailuerTap(FailureEnum.trueAnswer);
            },
          ),
        ],
      ),
    );
  }
}

class SelectTapFailure extends StatelessWidget {
  final bool isSelect;
  final String? text;
  final Function()? onTap;
  const SelectTapFailure(
      {super.key, this.isSelect = false, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: isSelect
                  ? text == 'true'
                      ? Color.fromRGBO(106, 209, 0, 1)
                      : Color.fromRGBO(8, 202, 254, 1)
                  : Colors.transparent,
              border: Border.all(
                  color: text == 'true'
                      ? Color.fromRGBO(106, 209, 0, 1)
                      : Color.fromRGBO(8, 202, 254, 1),
                  width: 2.5),
              borderRadius: BorderRadius.circular(8)),
          child: CustomText(
            text: text ?? '',
            textAlign: TextAlign.center,
            fontSize: Dimensions.fontSize18,
            color: !isSelect
                ? text == 'true'
                    ? Color.fromRGBO(106, 209, 0, 1)
                    : Color.fromRGBO(8, 202, 254, 1)
                : Colors.white,
            fontWeight: FontWeight.bold,
            maxLine: 1,
          ),
        ),
      ),
    );
  }
}
