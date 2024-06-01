import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/student/questions/base/widget/header_failure_status.dart';
import 'package:shater/presentation/screens/student/questions/base/widget/header_sucss_failure.dart';
import 'package:shater/presentation/screens/student/questions/failure%20question/widget/show_expalin_widget.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/arithmetic_text.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/complete_value.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/comprehensive_image.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/match_image.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/match_text.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/mathematical_operations.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/multi_choice_image.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/multi_choice_text.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/multi_choice_virtical.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/order_text.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/true_or_false_image.dart';
import 'package:shater/presentation/screens/student/questions/question%20answer/writing_board.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/presentation/screens/student/questions/question/widget/header_question_section.dart';
import 'package:shater/presentation/screens/student/questions/question/widget/image_question_section.dart';

import '../../question answer/order_image.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<QuestionController>(
        builder: (controller) {
          return Column(
            children: [
              controller.questionStatus.getHeaderWidget(
                SuccssOrFailureHeader(
                  controller: controller,
                ),
                getHeaderFailure(controller),
                HeaderQuestionSection(
                  controller: controller,
                ),
              ),
              controller.failureTap.getBodyForQuestion(
                  explainWidget: ShowExpalinWidget(),
                  stable: ImageQuestionSection(
                      media: controller.questionModel?.media,
                      text: controller.questionModel?.questionMedia,
                      url: controller.questionModel?.media == 'video'
                          ? controller
                              .questionModel?.urls?.first.entries.first.value
                          : controller.questionModel?.questionMedia),
                  success: ImageQuestionSection(
                      media: controller.questionModel?.media,
                      text: controller.questionModel?.questionMedia,
                      url: controller.questionModel?.media == 'video'
                          ? controller
                              .questionModel?.urls?.first.entries.first.value
                          : controller.questionModel?.questionMedia)),
              Visibility(
                visible: controller.failureTap != FailureEnum.showExpalin,
                child: IgnorePointer(
                  ignoring: controller.isAnswer,
                  child: getWidget(controller),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getWidget(QuestionController controller) {
    switch (controller.questionType?.qtype) {
      case QType.MultiChoiceText:
        return MultiChoiceText(
          controller: controller,
        );
      case QType.TrueOrFalseImage:
        return TrueOrFalseImage(
          controller: controller,
        );
      case QType.ComprehensiveImage:
        return ComprehensiveImage(
          controller: controller,
        ); /*getComprehensiveImageWidget*/
      case QType.CompleteValue:
        return CompleteValue(
          controller: controller,
        );
      case QType.WritingBoard:
        return WritingBoard(
          controller: controller,
        );
      case QType.MultiChoiceImage:
        return MultiChoiceImage(
          controller: controller,
        );
      case QType.MultiChoiceVirtical:
        return MultiChoiceVirtical(
          controller: controller,
        );
      case QType.ArithmeticText:
        return ArithmeticText(
          controller: controller,
        );
      // case QType.MatchImage:
      //   return MatchingQuizScreen(
      //       // controller: controller,
      //       );
      case QType.MatchText:
        return MyWidgetMatch(
            // controller: controller,
            );
      case QType.OrderImage:
        return OrderImage(
          controller: controller,
        );

      case QType.OrderWord:
        return OrderText(
          controller: controller,
        );
      // case QType.MathematicalOperations:
      //   return MathematicalOperations(
      //     controller: controller,
      //   );
      default:
        return SizedBox();
    }
  }

  Widget getHeaderFailure(QuestionController controller) {
    if (controller.timeNumber == 0) {
      if (controller.selectAnswer.isNotEmpty && controller.isAnswer) {
        Timer(Duration(seconds: 2), () {
          controller.setNumberTime(1);
        });
      }
      return SuccssOrFailureHeader(
        controller: controller,
      );
    } else {
      return HeaderFailureStatus(
        controller: controller,
      );
    }
  }
}
