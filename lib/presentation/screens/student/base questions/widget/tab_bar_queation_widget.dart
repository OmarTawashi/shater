import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/controller/base_question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class TabBarQuestion extends StatelessWidget {
  final BaseQuestionController? controller;
  const TabBarQuestion({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: SectionHeaderDelegate(
            height: 70,
            widget: Container(
              decoration: BoxDecoration(color: COLORS.secanderyColor),
              child: Row(
                children: [
                  SizedBox(
                    width: Dimensions.paddingSize16,
                  ),
                  Container(
                    padding: EdgeInsets.all(18),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: COLORS.primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignOutside)),
                    child: CustomText(
                      text: '0',
                      color: Colors.white,
                      fontSize: Dimensions.fontSize16,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Row(
                        children: [
                          TapSection(
                            selectColor: COLORS.primaryColor,
                            unSelectTextColor: COLORS.primaryColor,
                            isSelected: (controller?.selectTap ==
                                BaseQuestionTap.lesson),
                            onTap: () {
                              controller?.changTap(BaseQuestionTap.lesson);
                            },
                            text: BaseQuestionTap.lesson.name.tr,
                          ),
                          TapSection(
                            selectColor: COLORS.primaryColor,
                            unSelectTextColor: COLORS.primaryColor,
                            isSelected: (controller?.selectTap ==
                                BaseQuestionTap.question),
                            onTap: () {
                              controller?.changTap(BaseQuestionTap.question);
                            },
                            text: BaseQuestionTap.question.name.tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
