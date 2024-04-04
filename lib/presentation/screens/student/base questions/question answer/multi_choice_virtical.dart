import 'package:flutter/material.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/dimensions.dart';

class MultiChoiceVirtical extends StatelessWidget {
  final QuestionController? controller;
  const MultiChoiceVirtical({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          itemCount: controller?.questionModel?.answer?.length ?? 0,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
          separatorBuilder: (context, index) => SizedBox(
            height: Dimensions.paddingSize12 + 1,
          ),
          itemBuilder: (context, index) {
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
