import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/perfect_app_bar.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/result/controller/result_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: COLORS.secanderyColor,
      appBar: PerfectAppBar(),
      body: GetBuilder<ResultController>(
        builder: (controller) => RefreshIndicator.adaptive(
          color: Colors.black,
          onRefresh: () async {
            controller.fetchResultSubject();
          },
          child: CustomScrollView(
            slivers: [
              IntikeTapBar(
                assetName: ICONS.topResult,
                child: Row(
                  children: [
                    TapSection(
                      isSelected: true,
                      text: 'results'.tr,
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              AnimatorContainer(
                viewType: controller.viewType,
                isSliver: true,
                errorWidget: CustomEmptyView(
                  assetName: ICONS.resultTapActive,
                  primaryText: 'results',
                  secanderyText: 'error_for_get_results',
                ),
                // shimmerWidget: CustomShimmerList(
                //   itemShimmer: SubjectShimmer(),
                // ),
                emptyParams: EmptyParams(
                    text: 'subjects'.tr,
                    caption: 'empty_subject'.tr,
                    image: ICONS.decriptionTop),
                successWidget: ResultList(controller),
                retry: () {
                  controller.fetchResultSubject();
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

  SliverList ResultList(ResultController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.resultExams.length,
        (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                controller.setResultExam(controller.resultExams[index]);
                Get.toNamed(Routes.getResultSubjectScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 38,
                          child: CachedNetworkImageWidget(
                              fit: BoxFit.cover,
                              height: 80,
                              width: 80,
                              imageUrl:
                                  controller.resultExams[index].image ?? ''),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.paddingSize16,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller.resultExams[index].title ?? '',
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(right: Get.width * 0.3),
                                    child: CustomText(
                                      text: 'الاسبوع الماضي',
                                      color: Color.fromRGBO(3, 90, 154, 1),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Transform(
                                    transform: Matrix4.rotationY(pi),
                                    alignment: Alignment.center,
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxHeight: 10, maxWidth: 180.w),
                                      child: FAProgressBar(
                                        backgroundColor:
                                            Color.fromRGBO(7, 182, 236, 1),
                                        progressColor: COLORS.primaryColor,
                                        currentValue: controller
                                                .resultExams[index]
                                                .lastExam
                                                ?.totalCorrect
                                                ?.toDouble() ??
                                            0,
                                        size: 180.w,
                                        maxValue: controller.resultExams[index]
                                                .countQuestions
                                                ?.toDouble() ??
                                            0,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomText(
                                    text:
                                        '${controller.resultExams[index].countQuestions ?? 0}/${controller.resultExams[index].lastExam?.totalCorrect ?? 0}',
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: COLORS.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 23,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(
              endIndent: 60,
              thickness: 1,
              height: 50,
              color: Color.fromRGBO(7, 182, 236, 1),
            )
          ],
        ),
      ),
    );
  }
}
