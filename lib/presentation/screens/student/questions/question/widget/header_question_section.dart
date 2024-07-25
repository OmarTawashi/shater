import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/util/dimensions.dart';

class HeaderQuestionSection extends StatelessWidget {
  final QuestionController controller;
  const HeaderQuestionSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Dimensions.paddingSize10 + 2,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 28.0.w),
                  child: CustomText(
                    text: controller.questionModel?.title ?? '',
                    fontSize: Dimensions.fontSize16 + 1,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(96, 96, 96, 1),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final linkAudio = controller.questionModel?.titleAudio ?? '';
                  controller.playAudioUrl(linkAudio);
                },
                child: Icon(
                  Icons.audio_file,
                ),
              )
            ],
          ),
          SizedBox(
            height: Dimensions.paddingSize10,
          ),
          CustomText(
            text: controller.questionModel?.titleExtra ?? '',
            fontSize: Dimensions.fontSize16,
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(123, 123, 123, 1),
          ),
        ],
      ),
    );
  }
}
