import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/views/screens/base/svgpicture_custom.dart';
import 'package:shater/views/screens/base/text_custom.dart';

import '../../../../util/images.dart';
import '../../base/intike_tab_bar.dart';
import '../../base/perfect_app_bar.dart';
import '../../base/tap_section.dart';
import '../controller/firsts_controller.dart';
import '../widgets/intik_text_top.dart';

class FirstsScreen extends StatelessWidget {
  const FirstsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<FirstsController>(
      builder: (controller) => CustomScrollView(slivers: [
        const PerfectAppBar(
          assetName: ICONS.firstsTop,
        ),
        IntikeTapBar(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TapSection(
                isSelected:
                    (controller.selectSection == TabFirsts.studentToday),
                onTap: () {
                  controller.changeSection(TabFirsts.studentToday);
                },
                text: 'student_today'.tr,
              ),
              TapSection(
                isSelected: (controller.selectSection == TabFirsts.schoolToday),
                onTap: () {
                  controller.changeSection(TabFirsts.studentToday);
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
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 15,
            (context, index) => ItemFirstStudents(),
          ),
        )
      ]),
    ));
  }
}

class ItemFirstStudents extends StatelessWidget {
  const ItemFirstStudents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize5.h),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 26, 16, 26),
            margin: const EdgeInsets.only(right: Dimensions.paddingSize16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: COLORS.primaryColor,
            ),
            child: CustomText(
              text: '1',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: Dimensions.fontSize16.sp,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
              margin:const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: COLORS.primaryColor),
              child: ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 12,
                leading: Image.asset(IMAGES.firstImages),
                title: CustomText(
                  text: 'أسماء سالم غنام الشمري',
                  fontWeight: FontWeight.bold,
                  textHeight: 1,
                  fontSize: Dimensions.fontSize13.sp,
                  color: Colors.white,
                ),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: "school".tr + ":\t",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize12.sp,
                      color: Colors.white,
                    ),
                    CustomText(
                      text: "اروى بنت الحارث",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize12.sp,
                      color: Color.fromRGBO(205, 223, 235, 1),
                    )
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomSvgPicture(assetName: ICONS.star),
                    SizedBox(
                      width: Dimensions.paddingSize8,
                    ),
                    CustomText(
                      text: "333",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize16.sp,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
