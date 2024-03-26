import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/base%20questions/failure%20question/controller/failure_question_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/constant.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class FailureQuestionScrren extends StatelessWidget {
  const FailureQuestionScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.secanderyColor,
      appBar: AppBar(
        backgroundColor: COLORS.secanderyColor,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: COLORS.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
      body: GetBuilder<FailureQuestionController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize16),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.paddingSize12,
                ),
                CustomText(
                  text: 'what_the_problem_of_this_question',
                  color: Colors.white,
                  fontSize: Dimensions.fontSize18,
                  fontWeight: FontWeight.bold,
                  maxLine: 1,
                ),
                SizedBox(
                  height: Dimensions.paddingSize25 + 10,
                ),
                ListView.separated(
                  itemCount: controller.reasonFailed.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: Dimensions.paddingSize16,
                  ),
                  itemBuilder: (context, index) {
                    final isSelect = (controller.selectIndex == index);
                    return GestureDetector(
                      onTap: () {
                        controller.changeIndex(index);
                      },
                      child: Container(
                        padding: EdgeInsets.all(18),
                        
                        decoration: BoxDecoration(
                            color:
                                isSelect ? COLORS.primaryColor : Colors.white,
                            border: Border.all(
                              color: COLORS.primaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(40)),
                        child: CustomText(
                          text: controller.reasonFailed[index],
                          color:
                              isSelect ? Colors.white : COLORS.primaryColor,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500,
                          fontSize: Dimensions.fontSize16,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Dimensions.paddingSize16,
                ),
                TextFormField(
                    controller: TextEditingController(),
                    keyboardType: TextInputType.text,
                    textDirection: TextDirection.rtl,
                    textInputAction: TextInputAction.done,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.white,
                    style: FontStyleConstant.hNLTRegular.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSize15,
                        locale: Locale(
                            APPCONSTANT.languages[1].languageCode ?? '',
                            APPCONSTANT.languages[0].languageCode)),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
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
                        borderSide:  BorderSide(
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
                        borderSide:  BorderSide(
                          color: Color.fromRGBO(221, 221, 221, 1),
                          width: 2,
                        ),
                      ),
                    )),
                SizedBox(
                  height: Dimensions.paddingSize25 + 25,
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(40)),
                  child: CustomCupertinoButton(
                    color: COLORS.primaryColor,
                    onPressed: () {},
                    text: 'send',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
