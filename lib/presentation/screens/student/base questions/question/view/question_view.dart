import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/presentation/screens/student/base%20questions/question%20answer/multi_choice_text.dart';
import 'package:shater/presentation/screens/student/base%20questions/question%20answer/true_or_false.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<QuestionController>(
        builder: (controller) {
          return IgnorePointer(
            ignoring: controller.isAnswer,
            child: getWidget(controller));
          // getWidget(controller);
        },
      ),
    );
  }

  Widget getWidget(QuestionController controller) {
    final question =
        controller.questionPage?.questions?[controller.questionIndex];
    switch (controller.questionType?.qtype) {
      case QType.MultiChoiceText:
        return MultiChoiceText(
          controller: controller,
        );
      case QType.TrueOrFalse:
        return TrueOrFalse(
          controller: controller,
        );
      default:
        return SizedBox();
    }
  }
}
