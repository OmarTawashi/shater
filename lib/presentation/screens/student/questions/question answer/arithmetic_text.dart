import 'package:flutter/material.dart';
import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class ArithmeticText extends StatelessWidget {
  final QuestionController? controller;
  const ArithmeticText({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    controller?.getObjetArithmitic();
    // controller?.getListAndIndex();
    int indexPrimary = 0;
    final questionContent = controller?.arithmeticTextModel?.questionContent;

    if (questionContent != null && questionContent.isNotEmpty) {
      for (int i = 0; i < questionContent.length; i++) {
        final element = questionContent[i];
        if (indexPrimary < questionContent.length) {
          List ans = [];
          controller?.arithmeticTextModel?.questionContent?[indexPrimary]
              .forEach((element) {
            ans.add(element.fieldType);
          });
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  runSpacing: Dimensions.paddingSize12,
                  alignment: WrapAlignment.start,
                  spacing: Dimensions.paddingSize10,
                  children: List.generate(
                      controller?.arithmeticTextModel
                              ?.questionContent?[indexPrimary].length ??
                          0, (indexParent) {
                    final questionContent = controller
                        ?.arithmeticTextModel?.questionContent?[indexPrimary];
                    final answer = ans[indexParent];
                    return answer.toString().getQuestionArithmicitcTextWidget(
                          numberWithFraction: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  questionContent?[indexParent]
                                          .subFields
                                          ?.length ??
                                      0,
                                  (index) => Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      getSwitchInputText(
                                        questionContent?[indexParent]
                                            .subFields?[index]
                                            .isAnswer,
                                        inputField: InputAnswerOperater(
                                          row: 1,
                                        ),
                                        stable: ItemStableText(
                                          text: questionContent?[indexParent]
                                                  .subFields?[index]
                                                  .title ??
                                              '0',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              getSwitchInputText(
                                  questionContent?[indexParent].isAnswer,
                                  inputField: InputAnswerOperater(
                                    row: 2,
                                  ),
                                  stable: ItemStableText(
                                    text: questionContent?[indexParent].title,
                                    row: 2,
                                  )),
                            ],
                          ),
                          fraction: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              questionContent?[indexParent].subFields?.length ??
                                  0,
                              (index) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  getSwitchInputText(
                                    questionContent?[indexParent]
                                        .subFields?[index]
                                        .isAnswer,
                                    inputField: InputAnswerOperater(
                                      row: 1,
                                    ),
                                    stable: ItemStableText(
                                      text: questionContent?[indexParent]
                                              .subFields?[index]
                                              .title ??
                                          '0',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  )
                                ],
                              ),
                            ),
                          ),
                          other: TypeOperatorText(
                            text: questionContent?[indexParent].title,
                          ),
                          stable: SizedBox(
                            width: 1,
                          ),
                        );
                  }),
                ),
              ],
            ),
          );
        }
        indexPrimary++;
      }
    }
    return SizedBox();
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

Widget getSwitchInputText(bool? isAnswer,
    {required Widget inputField, required Widget stable}) {
  if (isAnswer == true) {
    return inputField;
  } else {
    return stable;
  }
}

class InputAnswerOperater extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? textEditingController;
  final double row;
  const InputAnswerOperater(
      {super.key, this.textEditingController, this.onChanged, this.row = 1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textAlign: TextAlign.center,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      style: FontStyleConstant.hNLTBMedium.copyWith(
        fontSize: Dimensions.fontSize16,
        color: COLORS.primaryColor,
        fontWeight: FontWeight.bold,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        constraints: BoxConstraints(maxHeight: 35 * row, maxWidth: 35),
        contentPadding: EdgeInsets.all(5),
        fillColor: Color.fromRGBO(190, 190, 190, 1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide.none),
        labelText: '',
      ),
    );
  }
}
