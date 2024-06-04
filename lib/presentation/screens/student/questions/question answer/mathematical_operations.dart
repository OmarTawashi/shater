import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/data/model/arthimitic_object.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/long_division.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MathMaticalOperation extends StatelessWidget {
  final QuestionController controller;
  const MathMaticalOperation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.getObjetArithmitic();
    final questionContent = controller.arithmeticTextModel?.questionContent;

    if (questionContent != null && questionContent.isNotEmpty) {
      controller.setTypAnsLongDivison(questionContent);
      return Container(
        padding: EdgeInsets.only(right: 16, left: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(questionContent.length, (indexParent) {
              final firstHalf = questionContent[indexParent].sublist(0, 5);
              final secondHalf = questionContent[indexParent].sublist(5);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 8,
                        children: List.generate(firstHalf.length,
                            (index) => getItemWidget(firstHalf[index], controller, index, indexParent))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 8,
                        children: List.generate(secondHalf.length,
                            (index) => getItemWidget(secondHalf[index], controller, index + 5, indexParent))),
                  ),
                ],
              );
            })),
      );
    }
    return SizedBox(
      width: Get.width,
      height: 0,
    );
  }
}

Widget getItemWidget(QuestionContent obje, QuestionController controller, int indexChild, int indexParent) {
  if (obje.title == null || obje.title == "") {
    return Container(
      constraints: BoxConstraints(maxHeight: 35, maxWidth: 37),
    );
  } else {
    return getSwitchInputText(
      obje.isSpace,
      inputField: StatefulBuilder(
        builder: (context, setState) => InputAnswerOperater(
            initValue: obje.title,
            row: 1,
            isWrite: controller.validLongDivision[indexParent][indexChild].inputField != null &&
                controller.validLongDivision[indexParent][indexChild].inputField != "",
            controller: controller,
            onChanged: (value) {
              setState(
                () {
                  controller.validLongDivision[indexParent][indexChild].inputField = value.arabicToEnglish();
                  controller.validLongDivision[indexParent][indexChild].isValid =
                      (controller.validLongDivision[indexParent][indexChild].inputField ==
                          controller.validLongDivision[indexParent][indexChild].input
                              ?.toString()
                              .arabicToEnglish());
                },
              );
              controller.setQuestionStatus(QuestionStatusEnum.select);
            }),
      ),
      stable: ItemStableText(
        text: obje.title,
        row: 1,
      ),
    );
  }
}

class TypeOperatorText extends StatelessWidget {
  final String? text;
  const TypeOperatorText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 70, maxWidth: 20),
      alignment: Alignment.center,
      child: CustomText(
        text: text ?? '',
        fontSize: Dimensions.fontSize24 - 2,
        textAlign: TextAlign.center,
        color: COLORS.primaryColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ItemStableText extends StatelessWidget {
  final String? text;
  final double? row;
  const ItemStableText({super.key, this.row, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 35 * (row ?? 1.0), maxWidth: 37),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: COLORS.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: CustomText(
        text: text ?? '',
        fontSize: Dimensions.fontSize16,
        textAlign: TextAlign.center,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

Widget getSwitchInputText(bool? isAnswer, {required Widget inputField, required Widget stable}) {
  if (isAnswer == true) {
    return inputField;
  } else {
    return stable;
  }
}
