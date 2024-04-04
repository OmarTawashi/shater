import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/constant.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class CompleteValue extends StatelessWidget {
  final QuestionController controller;
  const CompleteValue({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.paddingSize25,
          ),
          TextFormField(
              controller: controller.completeValueController,
              keyboardType: TextInputType.text,
              textDirection: TextDirection.rtl,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              cursorColor: COLORS.primaryColor,
              cursorWidth: 2.5,
              style: FontStyleConstant.hNLTRegular.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize16 + 1,
                  locale: Locale(APPCONSTANT.languages[1].languageCode ?? '',
                      APPCONSTANT.languages[0].languageCode)),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'not_answer'.tr;
              //   }

              //   return null;
              // },
              onChanged: (value) {
                if (value == null || value == '') {
                  controller.setQuestionStatus(QuestionStatusEnum.none);
                } else {
                  controller.setQuestionStatus(QuestionStatusEnum.select);
                }
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: controller.questionStatus.getBorderFieldColor(),
                        width: 2.5)),
                contentPadding: const EdgeInsets.all(25),
                filled: true,
                fillColor: Colors.white,
                hintText: 'answering'.tr,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: controller.questionStatus.getBorderFieldColor(),
                      width: 2.5),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        color: controller.questionStatus.getBorderFieldColor(),
                        width: 2.5)),
                hintStyle: FontStyleConstant.hNLTRegular.copyWith(
                  color: Color.fromRGBO(221, 221, 221, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize16 + 1,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 154, 20, 11),
                      width: 2.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: controller.questionStatus.getBorderFieldColor(),
                      width: 2.5),
                ),
              )),
          SizedBox(
            height: Dimensions.paddingSize25 + 25,
          ),
        ],
      ),
    );
  }
}
