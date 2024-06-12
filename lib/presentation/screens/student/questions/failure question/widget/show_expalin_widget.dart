import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/lesson/controller/lesson_controller.dart';
import 'package:shater/presentation/screens/student/questions/lesson/view/lesson_view.dart';
import 'package:shater/presentation/screens/student/teacher/controller/teacher_controller.dart';
import 'package:shater/presentation/screens/student/teacher/widget/teacher_list.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

import '../../../../base/animator_container.dart';

class ShowExpalinWidget extends StatelessWidget {
  const ShowExpalinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.6,
      margin: EdgeInsets.only(top: Dimensions.paddingSize10),
      decoration: BoxDecoration(color: COLORS.secanderyColor, borderRadius: BorderRadius.circular(4)),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize16, vertical: Dimensions.paddingSize8),
              margin: EdgeInsets.symmetric(
                  vertical: Dimensions.paddingSize8, horizontal: Dimensions.paddingSize16),
              decoration: BoxDecoration(color: COLORS.primaryColor, borderRadius: BorderRadius.circular(24)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: 'this_page_is_explain_of'.tr +
                        '\t\t' "${Get.find<LessonController>().videoPage.length}",
                    fontSize: Dimensions.fontSize14,
                    color: Colors.white,
                    maxLine: 1,
                  ),
                ],
              ),
            ),
            LessonView()
          ],
        ),
      ),
    );
  }
}//
