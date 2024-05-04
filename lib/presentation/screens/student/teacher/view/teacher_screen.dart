import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/perfect_app_bar.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';
import 'package:shater/presentation/screens/student/teacher/controller/teacher_controller.dart';
import 'package:shater/presentation/screens/student/teacher/widget/teacher_list.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PerfectAppBar(),
      body: GetBuilder<TeacherController>(
        builder: (controller) => RefreshIndicator.adaptive(
          onRefresh: () async {
            controller.getTeachers();
          },
          child: CustomScrollView(
            slivers: [
              IntikeTapBar(
                  assetName: ICONS.teacherTop,
                  secanderyChild: Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 16),
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
                              itemBuilder: (context, index) {
                                final isSelected =
                                    controller.selectedTapIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    controller.changeTapIndex(index);
                                    controller.getCourseSelected(index);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Dimensions.paddingSize25,
                                        vertical: 4),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5,
                                            color: isSelected
                                                ? Colors.transparent
                                                : COLORS.primaryColor
                                                    .withOpacity(0.4)),
                                        color: isSelected
                                            ? COLORS.primaryColor
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(32)),
                                    child: Center(
                                      child: CustomText(
                                          text:
                                              controller.subjects[index] ?? '',
                                          color: Colors.white,
                                          fontSize: Dimensions.fontSize14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: Dimensions.paddingSize5,
                                  ),
                              itemCount: controller.subjects.length);
                        },
                      ),
                    ),
                  )),
              AnimatorContainer(
                viewType: controller.viewType,
                isSliver: true,
                errorWidget: CustomEmptyView(
                  assetName: ICONS.teacherWhite,
                  primaryText: 'soon',
                  secanderyText: 'find_account_teacher',
                ),
                // shimmerWidget: CustomShimmerList(
                //   itemShimmer: SubjectShimmer(),
                // ),
                emptyParams: EmptyParams(
                    text: 'soon'.tr,
                    caption: 'find_account_teacher'.tr,
                    image: ICONS.decriptionTop),
                successWidget: TeacherList(controller: controller),
                retry: () {
                  controller.getTeachers();
                },
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
