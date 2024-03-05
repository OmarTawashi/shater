import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/data/model/student_model.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

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
        body: GetBuilder<FirstsController>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          controller.getData(controller.selectSection);
        },
        child: CustomScrollView(slivers: [
          const PerfectAppBar(),
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
          AnimatorContainer(
            viewType: controller.viewType,
            isSliver: true,
            errorWidget: CustomEmptyView(
              assetName: ICONS.firstsTop,
              primaryText: 'subjects',
              secanderyText: 'error_for_get_subject',
            ),
            emptyParams: EmptyParams(
                text: 'subjects',
                caption: 'empty_subject',
                image: ICONS.decriptionTop),
            successWidget: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.students.length,
                (context, index) => ItemFirstStudents(
                  student: controller.students[index],
                ),
              ),
            ),
            retry: () {
              controller.getData(controller.selectSection);
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100.h,
            ),
          )
        ]),
      ),
    ));
  }
}

class ItemFirstStudents extends StatelessWidget {
  final StudentModel? student;
  const ItemFirstStudents({super.key, this.student});

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
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: COLORS.primaryColor),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                        child: CachedNetworkImageWidget(
                          imageUrl: student?.student?.image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextStudentInfo(
                                textTitle: student?.student?.name,
                                title: 'الطالب',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextStudentInfo(
                                textTitle: student?.school?.name,
                                title: 'المدرسة',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextStudentInfo(
                                textTitle: student?.city?.name,
                                title: 'المنطقة',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: "${student?.score}",
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSize14.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: Dimensions.paddingSize8,
                      ),
                      CustomSvgPicture(assetName: ICONS.star),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextStudentInfo extends StatelessWidget {
  final String? title;
  final String? textTitle;
  const TextStudentInfo({super.key, this.textTitle, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: title!.tr + ":\t",
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSize10.sp,
          maxLine: 1,
          color: Colors.white,
        ),
        CustomText(
          text: textTitle ?? '',
          fontWeight: FontWeight.bold,
          maxLine: 1,
          fontSize: Dimensions.fontSize11.sp,
          color: Color.fromRGBO(205, 223, 235, 1),
        )
      ],
    );
  }
}
