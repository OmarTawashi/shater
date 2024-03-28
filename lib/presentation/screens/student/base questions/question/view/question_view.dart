import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/widget/header_failure_status.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/widget/header_sucss_failure.dart';
import 'package:shater/presentation/screens/student/base%20questions/question%20answer/complete_value.dart';
import 'package:shater/presentation/screens/student/base%20questions/question%20answer/multi_choice_text.dart';
import 'package:shater/presentation/screens/student/base%20questions/question%20answer/true_or_false_image.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/widget/header_question_section.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/widget/image_question_section.dart';

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
                  titleQuestion: controller.questionModel?.title ?? '',
                  subTitleQuestion: controller.questionModel?.titleExtra ?? '',
                ),
              ),
              ImageQuestionSection(
                  media: controller.questionModel?.media,
                  url: controller.questionModel?.media == 'video'
                      ? controller
                          .questionModel?.urls?.first.entries.first.value
                      : controller.questionModel?.questionMedia),
              IgnorePointer(
                ignoring: controller.isAnswer,
                child: getWidget(controller),
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
      case QType.VideoSkip:
        return SizedBox();
      case QType.CompleteValue:
        return CompleteValue(
          controller: controller,
        );
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
