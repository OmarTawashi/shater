import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/controller/base_question_controller.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/widget/close_question.dart';
import 'package:shater/presentation/screens/student/base%20questions/base/widget/tab_bar_queation_widget.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/view/question_view.dart';
import 'package:shater/routes/app_routes.dart';
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  controller.questionStatus == QuestionStatusEnum.failure
                      ? GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.getFailureQuestionScrren());
                        },
                          child: Icon(
                            Icons.insert_comment_outlined,
                            size: 30,
                            color: controller.questionStatus.getBgButtColor(),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(
                height: Dimensions.paddingSize10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: CupertinoButton(
                      child: CustomText(
                        text: controller.questionStatus.getButtonTextStatus(),
                        fontSize: Dimensions.fontSize16,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      borderRadius: BorderRadius.circular(80),
                      onPressed: controller.questionStatus.getOnPressButton(
                        onPressedSuccess: () {
                          controller.getSecandQuestion();
                        },
                        onPressedStable: () {
                          controller.checkAnswer();
                        },
                        onPressedFailure: () {
                          controller.getSecandQuestion();
                        },
                      ),
                      color: controller.questionStatus.getBgButtColor(),
                      disabledColor: Color.fromRGBO(228, 228, 228, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
          child: SizedBox(),
        );
      default:
        return QuestionView();
    }
  }
}
