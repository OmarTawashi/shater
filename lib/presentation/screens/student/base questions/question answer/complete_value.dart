import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/util/constant.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class CompleteValue extends StatelessWidget {
  final QuestionController controller;
  const CompleteValue({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            cursorColor: Colors.white,
            style: FontStyleConstant.hNLTRegular.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSize15,
                locale: Locale(APPCONSTANT.languages[1].languageCode ?? '',
                    APPCONSTANT.languages[0].languageCode)),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'not_answer'.tr;
              } else {
                controller.setQuestionStatus(QuestionStatusEnum.select);
              }

              return null;
            },
            decoration: InputDecoration(
              alignLabelWithHint: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(221, 221, 221, 1),
                    width: 2,
                  )),
              contentPadding: const EdgeInsets.all(18),
              filled: true,
              fillColor: Colors.white,
              hintText: 'other_write_me'.tr,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color.fromRGBO(221, 221, 221, 1),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(221, 221, 221, 1),
                    width: 2,
                  )),
              hintStyle: FontStyleConstant.hNLTRegular.copyWith(
                color: Color.fromRGBO(221, 221, 221, 1),
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSize15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Color.fromRGBO(221, 221, 221, 1),
                  width: 2,
                ),
              ),
            )),
      ],
    );
  }
}
