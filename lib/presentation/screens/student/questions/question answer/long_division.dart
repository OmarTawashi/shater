import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/data/model/arthimitic_object.dart';
import 'package:shater/data/model/typing_answer.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

// class LongDivision extends StatelessWidget {
//   final QuestionController controller;
//   const LongDivision({super.key, required this.controller});

//   Widget build(BuildContext context) {
//     controller.getObjetArithmitic();
//     // controller?.getListAndIndex();
//     int indexPrimary = 0;
//     final questionContent = controller.arithmeticTextModel?.questionContent;

//     if (questionContent != null && questionContent.isNotEmpty) {
//       for (int i = 0; i < questionContent.length; i++) {
//         final listShow = questionContent[i];
//         if (indexPrimary < questionContent.length) {
//           return Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 Wrap(
//                   runSpacing: Dimensions.paddingSize12,
//                   alignment: WrapAlignment.start,
//                   spacing: Dimensions.paddingSize10,
//                   children: List.generate(listShow.length ?? 0, (indexParent) {
//                     controller.validArithimticText;
//                     final listing = listShow[indexParent];
//                     return getSwitchInputText(listing.isSpace,
//                         inputField: InputAnswerOperater(
//                           initValue: listing.title,
//                           row: 1,
//                           controller: controller,
//                         ),
//                         stable: ItemStableText(
//                           text: listing.title,
//                           row: 1,
//                         ));
//                   }),
//                 ),
//               ],
//             ),
//           );
//         }
//         indexPrimary++;
//       }
//     }
//     return SizedBox(
//       width: Get.width,
//       height: 0,
//     );
//   }
// }

class LongDivision extends StatelessWidget {
  final QuestionController controller;
  const LongDivision({super.key, required this.controller});

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
                        // runSpacing: 8,
                        spacing: 8,
                        children: List.generate(firstHalf.length,
                            (index) => getItemWidget(firstHalf[index], controller, index, indexParent))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        // runSpacing: 8,
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

  Widget getItemWidget(QuestionContent obje, QuestionController controller, int indexChild, int indexParent) {
    if (obje.title == null || obje.title == "") {
      return Container(
        constraints: BoxConstraints(maxHeight: 35, maxWidth: 37),
      );
    } else {
      bool? ckeckDivisor = obje.isDivisor == true;
      bool? sameRaw = (indexParent == 1 && ckeckDivisor == false);
      return CustomBorderBox(
          showBottomLine: ckeckDivisor,
          showRightLine: ckeckDivisor,
          isDivisor: ckeckDivisor,
          showTopLine: sameRaw,
          child: getSwitchInputText(
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
                        controller.validLongDivision[indexParent][indexChild].inputField =
                            value.arabicToEnglish();
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
          ));
    }
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

class CustomBorderBox extends StatelessWidget {
  final Widget child;
  final bool isDivisor;
  final bool showBottomLine;
  final bool showRightLine;
  final bool showTopLine;

  const CustomBorderBox({
    Key? key,
    required this.child,
    this.isDivisor = false,
    this.showBottomLine = false,
    this.showRightLine = false,
    this.showTopLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isDivisor ? EdgeInsets.all(1) : null,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        border: Border(
          left: BorderSide.none,
          right: showRightLine ? BorderSide(color: COLORS.primaryColor, width: 3.5) : BorderSide.none,
          bottom: showBottomLine ? BorderSide(color: COLORS.primaryColor, width: 3.5) : BorderSide.none,
          top: showTopLine ? BorderSide(color: COLORS.primaryColor, width: 3.5) : BorderSide.none,
        ),
      ),
      child: child,
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

class InputAnswerOperater extends StatelessWidget {
  final TextEditingController? textEditingController;
  final QuestionController? controller;
  final bool isWrite;
  final String? initValue;
  final Function(String)? onChanged;
  final double row;
  const InputAnswerOperater(
      {super.key,
      this.textEditingController,
      this.isWrite = false,
      this.controller,
      this.onChanged,
      this.initValue,
      this.row = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      // keyboardType: TextInputType.,
      style: FontStyleConstant.hNLTBMedium.copyWith(
          fontSize: Dimensions.fontSize16,
          color: isWrite ? Colors.white : COLORS.primaryColor,
          fontWeight: FontWeight.bold,
          height: 1),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        constraints: BoxConstraints(maxHeight: 35 * row, maxWidth: 35),
        contentPadding: EdgeInsets.all(5),
        fillColor: isWrite ? COLORS.primaryColor : Color.fromRGBO(190, 190, 190, 1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none),
        disabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0), borderSide: BorderSide.none),
        labelText: '',
      ),
    );
  }
}
