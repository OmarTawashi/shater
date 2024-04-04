import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/teacher/controller/teacher_controller.dart';
import 'package:shater/presentation/screens/teacher/widget/teacher_list.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

import '../../../../base/animator_container.dart';

class ShowExpalinWidget extends StatelessWidget {
  const ShowExpalinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: COLORS.secanderyColor,
          borderRadius: BorderRadius.circular(Dimensions.radius15)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            margin: EdgeInsets.symmetric(
                vertical: Dimensions.paddingSize8,
                horizontal: Dimensions.paddingSize25),
            decoration: BoxDecoration(
                color: COLORS.primaryColor,
                borderRadius: BorderRadius.circular(24)),
            child: CustomText(
              text: 'this_page_is_explain_of' + '\t\t' "0",
              fontSize: Dimensions.fontSize14,
              color: Colors.white,
              maxLine: 1,
            ),
          ),
          SizedBox(
            height: Dimensions.paddingSize25,
          ),
          GetBuilder<TeacherController>(
            builder: (controller) => AnimatorContainer(
              viewType: controller.viewType,
              isSliver: true,
              errorWidget: CustomEmptyView(
                assetName: ICONS.teacherWhite,
                primaryText: 'soon',
                secanderyText: 'find_account_teacher',
              ),
              emptyParams: EmptyParams(
                  text: 'soon'.tr,
                  caption: 'find_account_teacher'.tr,
                  image: ICONS.decriptionTop),
              successWidget: TeacherList(controller: controller),
              retry: () {
                controller.getTeachers();
              },
            ),
          ),
        ],
      ),
    );
  }
}
