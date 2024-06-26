import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/teacher/Explanation/teacher_explanation_controller.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/selected_page_exercise.dart';
import 'package:shater/presentation/screens/teacher/My%20Explanation/custom_button.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget(
      {required this.page_number,
      this.canCreateQuestion = 0,
      required this.subject_id});
  final String page_number;
  final int subject_id;

  final int canCreateQuestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        height: 300,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "صفحة رقم $page_number ",
                style: TextStyle(
                    color: COLORS.midNightBlueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Dimensions.paddingSize25,
            ),
            CustomeButton(
              onClick: () {},
              title: "add_explain".tr,
              backgroundColor: COLORS.primaryColor,
              fontSize: 16,
              borderRadius: 27,
              height: 54.h,
            ),
            SizedBox(
              height: Dimensions.paddingSize10,
            ),
            canCreateQuestion == 1
                ? CustomeButton(
                    onClick: () async {
                      await Get.find<TeacherExplanationController>()
                          .getSpecificPageExercisesModelList(
                        subject_id: subject_id,
                        pageFrom: int.parse(page_number),
                        PageTo: int.parse(page_number),
                      );

                      Get.to(() => SelectedPageExercise(
                            selected_page: page_number,
                          ));
                    },
                    title: "practices".tr,
                    backgroundColor: COLORS.secanderyColor,
                    fontSize: 16,
                    height: 54.h,
                    borderRadius: 27,
                  )
                : SizedBox(),
            SizedBox(
              height: Dimensions.paddingSize20,
            ),
            CustomeButton(
              onClick: () => Get.back(),
              title: "cancel".tr,
              backgroundColor: COLORS.cardColor,
              fontSize: 16,
              borderRadius: 27,
              height: 54.h,
              borderwidth: 4,
              textStyle: TextStyle(
                  color: COLORS.primaryColor,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
