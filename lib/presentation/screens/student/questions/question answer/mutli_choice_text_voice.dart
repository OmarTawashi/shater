import 'package:flutter/material.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/dimensions.dart';

class MultiChoiceTextVoice extends StatelessWidget {
  final QuestionController? controller;
  MultiChoiceTextVoice({super.key, this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          itemCount: controller?.questionModel?.answer?.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            // final typeAns =
            //     TypingAnswer(input: controller?.questionModel?.answer?[index]);
            // final isSelect = controller?.selectAnswer.contains(typeAns);
            final isSelect = controller?.selectAnswer
                .contains(controller?.questionModel?.answer?[index]);

            return GestureDetector(
              onTap: () {
                controller
                    ?.setAnswer(controller?.questionModel?.answer?[index]);
              },
              child: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSize16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: isSelect == true
                          ? controller?.questionStatus.getGridItemColor()
                          : Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 0,
                            offset: Offset(0, 0))
                      ]),
                  child: Center(
                    child: CustomText(
                      text: controller?.questionModel?.answer?[index],
                      fontSize: Dimensions.fontSize16,
                      textAlign: TextAlign.center,
                      color: isSelect == true
                          ? Colors.white
                          : Color.fromRGBO(96, 96, 96, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            );
          },
        )
      ],
    );
  }
}
