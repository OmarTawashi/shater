import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/student/firsts/widgets/item_first_student.dart';
import 'package:shater/presentation/screens/student/firsts/widgets/item_school_rate.dart';
import 'package:shater/presentation/screens/student/firsts/widgets/shimmer_list.dart';

import '../../../../../util/images.dart';
import '../../../base/custom_empty_view.dart';
import '../../../base/intike_tab_bar.dart';
import '../../../base/perfect_app_bar.dart';
import '../../../base/tap_section.dart';
import '../controller/firsts_controller.dart';
import '../widgets/intik_text_top.dart';

class FirstsScreen extends StatelessWidget {
  const FirstsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: PerfectAppBar(),
        body: GetBuilder<FirstsController>(
          builder: (controller) => RefreshIndicator(
            onRefresh: () async {
              controller.getData(controller.selectSection);
            },
            child: CustomScrollView(slivers: [
              // const PerfectAppBar(),
              IntikeTapBar(
                assetName: ICONS.firstsTop,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TapSection(
                      isSelected:
                          (controller.selectSection == TabFirsts.studentToday),
                      onTap: () {
                        controller.changeSection(TabFirsts.studentToday);
                        controller.getData(TabFirsts.studentToday);
                      },
                      text: 'student_today'.tr,
                    ),
                    TapSection(
                      isSelected:
                          (controller.selectSection == TabFirsts.schoolToday),
                      onTap: () {
                        controller.changeSection(TabFirsts.schoolToday);
                        controller.getData(TabFirsts.schoolToday);
                      },
                      text: 'school_today'.tr,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 8.h,
                ),
              ),
              const SliverToBoxAdapter(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IntikTextTop(
                      text: 'leader',
                    ),
                    IntikTextTop(
                      text: 'points',
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 8.h,
                ),
              ),
              getList(controller),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100.h,
                ),
              )
            ]),
          ),
        ));
  }

  Widget getList(FirstsController controller) {
    switch (controller.selectSection) {
      case TabFirsts.schoolToday:
        return AnimatorContainer(
          viewType: controller.viewType,
          isSliver: true,
          errorWidget: CustomEmptyView(
            assetName: ICONS.firstsTop,
            primaryText: 'school_today'.tr,
            secanderyText: 'error_for_get_school',
          ),
          shimmerWidget: ShimmerList(),
          emptyParams: EmptyParams(
              text: 'school_today'.tr, caption: 'empty_school_today'.tr, image: ICONS.firstsTop),
          successWidget: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.school.length,
              (context, index) => ItemSchoolRate(
                school: controller.school[index],
                index: index + 1,
              ),
            ),
          ),
          retry: () {
            controller.getData(controller.selectSection);
          },
        );
      case TabFirsts.studentToday:
        return AnimatorContainer(
          viewType: controller.viewType,
          isSliver: true,
          errorWidget: CustomEmptyView(
            assetName: ICONS.firstsTop,
            primaryText: 'first_student',
            secanderyText: 'error_for_get_first_student',
          ),
          shimmerWidget: ShimmerList(),
          emptyParams: EmptyParams(
              text: 'first_student'.tr,
              caption: 'empty_first_student',
              image: ICONS.firstsTop),
          successWidget: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.students.length,
              (context, index) => ItemFirstStudents(
                student: controller.students[index],
                index: index + 1,
              ),
            ),
          ),
          retry: () {
            controller.getData(controller.selectSection);
          },
        );

      default:
        return AnimatorContainer(
          viewType: controller.viewType,
          isSliver: true,
          errorWidget: CustomEmptyView(
            assetName: ICONS.firstsTop,
            primaryText: 'subjects',
            secanderyText: 'error_for_get_subject',
          ),
          shimmerWidget: ShimmerList(),
          emptyParams: EmptyParams(
              text: 'first_student',
              caption: 'empty_first_student',
              image: ICONS.firstsTop),
          successWidget: SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.students.length,
              (context, index) => ItemFirstStudents(
                student: controller.students[index],
                index: index + 1,
              ),
            ),
          ),
          retry: () {
            controller.getData(controller.selectSection);
          },
        );
    }
  }
}
