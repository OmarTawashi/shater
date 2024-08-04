import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shater/data/model/page_model.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/semester_type_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';
import 'package:shater/presentation/screens/student/pages%20subject/controller/page_subject_controller.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class PageSubjectScreen extends StatelessWidget {
  const PageSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: COLORS.secanderyColor,
      bottomNavigationBar: GetBuilder<PageSubjectController>(
        builder: (controller) => Container(
          margin: EdgeInsets.only(
              bottom: 80,
              left: Dimensions.paddingSize16,
              right: Dimensions.paddingSize16),
          child: CustomCupertinoButton(
            color: COLORS.primaryColor,
            text: 'exercied',
            isLoading: controller.isLoadingButton,
            onPressed: () {
              controller.fetchQuestionSubject();
            },
          ),
        ),
      ),
      appBar: AppBar(
        leadingWidth: 130.w,
        backgroundColor: COLORS.primaryColor,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    color: COLORS.backGroundColor,
                    borderRadius: BorderRadius.circular(32)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: Dimensions.paddingSize5,
                    ),
                    CustomText(
                      text:
                          Get.find<SubjectController>().selectedCourse?.title ??
                              '',
                      color: Colors.white,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize12,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          SemesterTypeWidget(
            semester: Get.find<DashBoardController>().level?.title,
          )
        ],
      ),
      body: GetBuilder<PageSubjectController>(
        builder: (controller) => Stack(children: [
          IgnorePointer(
            ignoring: controller.isLoadingScreen,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Dimensions.paddingSize5,
                  ),
                  Container(
                    height: 135,
                    width: 135,
                    alignment: Alignment.center,
                    // clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImageWidget(
                      imageUrl:
                          Get.find<SubjectController>().selectedCourse?.image ??
                              '',
                      fit: BoxFit.cover,
                      height: 135,
                      width: 135,
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.paddingSize20,
                  ),
                  CustomText(
                    text: 'select_exercise_pages',
                    fontSize: Dimensions.fontSize16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Dimensions.paddingSize10,
                  ),
                  CustomText(
                    text:
                        'study_todays_lesson_or_practice_for_future_lessons_by_specifying_the_page_numbers_that_contain_your_lessons',
                    fontSize: Dimensions.fontSize14,
                    textAlign: TextAlign.center,
                    textHeight: 1.8,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: Dimensions.paddingSize25 + 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: HeaderGetPage(
                          text: 'from_page_number',
                          page: controller.pageModel,
                          currentValue: controller.fromValue ?? 0,
                          minValue: controller.pageModel?.fromPageNo ?? -1,
                          maxValue: (controller.pageModel?.toPageNo ?? 2) - 1,
                          onChanged: (p0) {
                            controller.setFormValue(p0);
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: Dimensions.paddingSize16,
                            right: Dimensions.paddingSize16,
                            top: 60),
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: Colors.white,
                          weight: 3,
                        ),
                      ),
                      Expanded(
                        child: HeaderGetPage(
                          text: 'to_page_number',
                          page: controller.pageModel,
                          currentValue: ((controller.toValue ?? -1)),
                          minValue:
                              ((controller.pageModel?.fromPageNo ?? -2) + 1),
                          maxValue: (controller.pageModel?.toPageNo ?? 1),
                          onChanged: (p0) {
                            controller.setToValue(p0);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          controller.isLoadingScreen
              ? Container(
                  height: Get.height,
                  width: Get.width,
                  child: BackdropFilter(
                    filter: ColorFilter.mode(Colors.white24, BlendMode.color),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: COLORS.whiteColor,
                    )),
                  ),
                )
              : SizedBox()
        ]),
      ),
    );
  }
}

class HeaderGetPage extends StatelessWidget {
  final String? text;
  final PageModel? page;
  final int minValue;
  final int maxValue;
  final int currentValue;
  final Function(int)? onChanged;

  const HeaderGetPage(
      {super.key,
      this.text,
      this.onChanged,
      this.minValue = 0,
      this.maxValue = 0,
      this.currentValue = 0,
      this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize25,
              vertical: Dimensions.paddingSize16),
          decoration: BoxDecoration(
            color: COLORS.primaryColor,
            border: Border.all(width: 2, color: COLORS.strokeColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: CustomText(
            text: text ?? '',
            color: Colors.white,
            fontSize: Dimensions.fontSize12,
          ),
        ),
        SizedBox(
          height: Dimensions.paddingSize10,
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize8,
              vertical: Dimensions.paddingSize16),
          decoration: BoxDecoration(
              color: COLORS.primaryColor,
              borderRadius: BorderRadius.circular(12)),
          child: NumberPicker(
            minValue: minValue,
            maxValue: maxValue,
            // itemHeight: 5,
            itemHeight: 55,
            itemWidth: 200,
            value: currentValue,
            textStyle: FontStyleConstant.hNLTBMedium
                .copyWith(color: Colors.white, fontSize: Dimensions.fontSize15),
            axis: Axis.vertical,
            selectedTextStyle: FontStyleConstant.hNLTBMedium
                .copyWith(color: Colors.white, fontSize: Dimensions.fontSize18),
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.lighten,
              borderRadius: BorderRadius.circular(50),
              color: COLORS.secanderyColor,
            ),
            onChanged: onChanged!,
          ),
        ),
      ],
    );
  }
}
