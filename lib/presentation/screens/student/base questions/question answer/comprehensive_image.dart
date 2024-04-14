import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_extention.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/question%20answer/operate_one.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class ComprehensiveImage extends StatelessWidget {
  final QuestionController? controller;
  const ComprehensiveImage({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          runSpacing: Dimensions.paddingSize12,
          alignment: WrapAlignment.center,
          spacing: Dimensions.paddingSize10,
          children: List.generate(
              controller?.questionModel?.answer?.length ?? 0, (index) {
            final answer = controller?.questionModel?.answer?[index];
            return Builder(builder: (context) {
              controller?.setInputControllerComperhensiveImage(index);
              return answer.toString().getComprehensiveImageWidget(
                    inputField: InputAnswerOperater(
                      textEditingController: controller
                          ?.inputComperhensiveImage[index]
                          ?.textEditingController,
                      onChanged: (value) {
                        controller?.changeInputValueComperhensiveImage(
                            value, index);
                      },
                    ),
                    operator: Container(
                      width: 14,
                      height: 27,
                      child: CustomText(
                        text: controller!.questionModel!.answer![index]!,
                        fontSize: Dimensions.fontSize24,
                        color: COLORS.secanderyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    newLine: SizedBox(
                      width: Get.width,
                      height: 0,
                    ),
                    skipWidget: SizedBox(),
                    stable: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ItemStable(
                          text: controller?.questionModel?.answer?[index],
                          row: double.tryParse(controller
                                  ?.questionModel?.orderBy?['${index + 1}'] ??
                              '1'),
                        ),
                      ],
                    ),
                  );
            });
          }),
        )
      ],
    );
  }
}
