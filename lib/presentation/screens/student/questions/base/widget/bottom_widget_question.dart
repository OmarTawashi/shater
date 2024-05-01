import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/dimensions.dart';

class BottomWidgetQuestions extends StatelessWidget {
  const BottomWidgetQuestions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
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
                      text: controller.questionStatus
                          .getButtonTextStatus(controller: controller),
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
    );
  }
}
