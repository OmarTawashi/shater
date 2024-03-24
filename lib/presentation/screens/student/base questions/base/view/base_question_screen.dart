import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/controller/base_question_controller.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/widget/close_question.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/widget/header_failure_status.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/widget/header_sucss_failure.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/widget/tab_bar_queation_widget.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/view/question_view.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/widget/header_question_section.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/widget/image_question_section.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class BaseQuestionScreen extends StatelessWidget {
  const BaseQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: COLORS.secanderyColor,
        leading: CloseQuestion(),
      ),
      bottomNavigationBar: GetBuilder<QuestionController>(
        builder: (controller) => Container(
          margin: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize25,
            vertical: Dimensions.paddingSize16,
          ),
          child: CupertinoButton(
            child: CustomText(
              text: controller.questionPage
                          ?.questions?[controller.questionIndex]?.answer
                          ?.contains('<skip>') !=
                      true
                  ? 'check'
                  : 'skip',
              fontSize: Dimensions.fontSize16,
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 20),
            borderRadius: BorderRadius.circular(80),
            onPressed: () {
              // controller.getSecandQuestion();
              controller.checkAnswer();
            },
            color: controller.questionStatus.getBgButtColor(),
            disabledColor: Color.fromRGBO(228, 228, 228, 1),
          ),
        ),
      ),
      body: GetBuilder<BaseQuestionController>(
        builder: (controller) => CustomScrollView(
          slivers: [
            TabBarQuestion(
              controller: controller,
            ),
            SliverToBoxAdapter(
              child: GetBuilder<QuestionController>(
                builder: (controller) => Column(
                  children: [
                    controller.questionStatus.getHeaderWidget(
                      SuccssOrFailureHeader(
                        controller: controller,
                      ),
                      getHeaderFailure(controller),
                      HeaderQuestionSection(
                        titleQuestion: controller.questionPage
                                ?.questions?[controller.questionIndex]?.title ??
                            '',
                        subTitleQuestion: controller
                                .questionPage
                                ?.questions?[controller.questionIndex]
                                ?.titleExtra ??
                            '',
                      ),
                    ),
                    ImageQuestionSection(
                        media: controller.questionPage
                            ?.questions?[controller.questionIndex]?.media,
                        url: controller
                            .questionPage
                            ?.questions?[controller.questionIndex]
                            ?.questionMedia),
                  ],
                ),
              ),
            ),
            getView(controller)
          ],
        ),
      ),
    );
  }

  Widget getView(BaseQuestionController controller) {
    switch (controller.selectTap) {
      case BaseQuestionTap.question:
        return QuestionView();
      case BaseQuestionTap.lesson:
        return SliverToBoxAdapter(
          child: SizedBox(),
        );
      default:
        return QuestionView();
    }
  }

  Widget getHeaderFailure(QuestionController controller) {
    if (controller.timeNumber == 0) {
      if (controller.selectAnswer.isNotEmpty && controller.isAnswer) {
        Timer(Duration(seconds: 3), () {
          controller.setNumberTime(1);
        });
      }
      return SuccssOrFailureHeader(
        controller: controller,
      );
    } else {
      return HeaderFailureStatus();
    }
  }
}
