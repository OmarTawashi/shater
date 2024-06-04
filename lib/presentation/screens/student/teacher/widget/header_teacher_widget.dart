import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';
import 'package:shater/presentation/screens/student/teacher/controller/teacher_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class HeaderTeacherWidget extends StatelessWidget {
  final TeacherController controller;
  const HeaderTeacherWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: SectionHeaderDelegate(
            height: 65,
            widget: Container(
              padding: const EdgeInsets.fromLTRB(0, 14, 16, 14),
              decoration: const BoxDecoration(
                color: COLORS.strokeColor,
              ),
              child: GetBuilder<SubjectController>(
                builder: (subjetController) {
                  controller.iniGetSubject();
                  return ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final isSelected = controller.selectedTapIndex == index;
                        return GestureDetector(
                          onTap: () {
                            controller.changeTapIndex(index);
                            controller.getCourseSelected(index);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSize16,
                                vertical: 7),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.5,
                                    color: isSelected
                                        ? Colors.transparent
                                        : COLORS.primaryColor.withOpacity(0.4)),
                                color: isSelected
                                    ? COLORS.primaryColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: CustomText(
                                  text: controller.subjects[index] ?? '',
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: Dimensions.paddingSize5,
                          ),
                      itemCount: controller.subjects.length);
                },
              ),
            )));
  }
}
