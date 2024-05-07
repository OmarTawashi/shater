import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/question_status.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/base/controller/base_question_controller.dart';
import 'package:shater/presentation/screens/student/questions/question/controller/question_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class TabBarQuestion extends StatelessWidget {
  final BaseQuestionController? controller;
  const TabBarQuestion({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: SectionHeaderDelegate(
            height: 70,
            widget: Container(
              decoration: BoxDecoration(color: COLORS.secanderyColor),
              child: Row(
                children: [
                  SizedBox(
                    width: Dimensions.paddingSize16,
                  ),
                  GetBuilder<QuestionController>(
                    builder: (questionController) => Container(
                        padding: controller?.routeGIT ==
                                Routes.getPageSubjectScreen()
                            ? EdgeInsets.all(17)
                            : EdgeInsets.zero,
                        alignment: Alignment.center,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: questionController.questionStatus
                                .getBgButtColor(),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white,
                                width: 2,
                                strokeAlign: BorderSide.strokeAlignOutside)),
                        child: controller?.routeGIT ==
                                Routes.getPageSubjectScreen()
                            ? CustomText(
                                text: '${questionController.answerNumValid}',
                                color: Colors.white,
                                fontSize: Dimensions.fontSize16,
                              )
                            : CachedNetworkImage(
                                height: 52,
                                width: 52,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Image.asset(IMAGES.firstImages),
                                errorWidget: (BuildContext, String, Object) =>
                                    Image.asset(IMAGES.firstImages),
                                imageUrl: controller
                                        ?.subcriptionTeVideController
                                        ?.subjectVideoSelected
                                        ?.user
                                        ?.image ??
                                    '')),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Row(
                        children: [
                          TapSection(
                            selectColor: COLORS.primaryColor,
                            unSelectTextColor: COLORS.primaryColor,
                            isSelected: (controller?.selectTap ==
                                BaseQuestionTap.lesson),
                            onTap: () {
                              controller?.changTap(BaseQuestionTap.lesson);
                            },
                            text: BaseQuestionTap.lesson.name.tr,
                          ),
                          TapSection(
                            selectColor: COLORS.primaryColor,
                            unSelectTextColor: COLORS.primaryColor,
                            isSelected: (controller?.selectTap ==
                                BaseQuestionTap.question),
                            onTap: () {
                              controller?.changTap(BaseQuestionTap.question);
                            },
                            text: BaseQuestionTap.question.name.tr,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
