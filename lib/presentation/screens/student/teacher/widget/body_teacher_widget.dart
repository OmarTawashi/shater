import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/student/teacher/controller/teacher_controller.dart';
import 'package:shater/presentation/screens/student/teacher/widget/teacher_list.dart';
import 'package:shater/util/images.dart';

class BodyTeacherWidget extends StatelessWidget {
  final TeacherController controller;
  const BodyTeacherWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatorContainer(
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
    );
  }
}
