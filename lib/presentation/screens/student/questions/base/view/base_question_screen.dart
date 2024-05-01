import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/questions/base/controller/base_question_controller.dart';
import 'package:shater/presentation/screens/student/questions/base/widget/bottom_widget_lesson.dart';
import 'package:shater/presentation/screens/student/questions/base/widget/bottom_widget_question.dart';
import 'package:shater/presentation/screens/student/questions/base/widget/close_question.dart';
import 'package:shater/presentation/screens/student/questions/base/widget/tab_bar_queation_widget.dart';
import 'package:shater/presentation/screens/student/questions/lesson/view/lesson_view.dart';
import 'package:shater/presentation/screens/student/questions/question/view/question_view.dart';
import 'package:shater/util/color.dart';

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
      bottomNavigationBar: GetBuilder<BaseQuestionController>(
        builder: (controller) => getBottomWidget(controller),
      ),
      body: GetBuilder<BaseQuestionController>(
        builder: (controller) => CustomScrollView(
          slivers: [
            TabBarQuestion(
              controller: controller,
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
          child: LessonView(),
        );
      default:
        return QuestionView();
    }
  }

  Widget getBottomWidget(BaseQuestionController controller) {
    switch (controller.selectTap) {
      case BaseQuestionTap.question:
        return BottomWidgetQuestions();
      case BaseQuestionTap.lesson:
        return BottomWidgetLesson();
      default:
        return BottomWidgetQuestions();
    }
  }
}
