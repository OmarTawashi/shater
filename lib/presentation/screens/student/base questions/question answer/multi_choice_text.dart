import 'package:flutter/material.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/dimensions.dart';

class MultiChoiceText extends StatelessWidget {
  final QuestionController? controller;
  MultiChoiceText({super.key, this.controller});
  @override
  Widget build(BuildContext context) {
    final question =
        controller?.questionPage?.questions?[controller!.questionIndex];

    return Column(
      children: [
        question?.answer?.contains('<skip>') != true
            ? GridView.builder(
                itemCount: question?.answer?.length,
                shrinkWrap: true,
                padding:
                    EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final isSelect = controller?.selectIndex == index;
                  return GestureDetector(
                    onTap: () {
                      controller?.setAnswer(question?.answer?[index]);
                      controller?.setSelectIndex(index);
                    },
                    child: Container(
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
                            text: question?.answer?[index],
                            fontSize: Dimensions.fontSize16,
                            color: isSelect == true
                                ? Colors.white
                                : Color.fromRGBO(96, 96, 96, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  );
                },
              )
            : SizedBox()
      ],
    );
  }
}
