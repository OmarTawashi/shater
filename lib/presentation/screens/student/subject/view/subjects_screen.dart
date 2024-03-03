import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_shimmer_list.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';
import 'package:shater/presentation/screens/student/subject/widgets/shimmer_subject.dart';
import 'package:shater/util/images.dart';

import '../../../base/animator_container.dart';
import '../../../base/intike_tab_bar.dart';
import '../../../base/perfect_app_bar.dart';
import '../../../base/tap_section.dart';
import '../widgets/item_subject.dart';

class SubjectsSCreen extends StatelessWidget {
  const SubjectsSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SubjectController>(
        builder: (controller) => RefreshIndicator.adaptive(
          color: Colors.black,
          onRefresh: () async {
            controller.fetchCourseLearning();
          },
          child: CustomScrollView(
            slivers: [
              const PerfectAppBar(),
              IntikeTapBar(
                assetName: ICONS.decriptionTop,
                child: Row(
                  children: [
                    TapSection(
                      isSelected: true,
                      text: 'subjects'.tr,
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
                errorWidget:  CustomShimmerList(itemShimmer: SubjectShimmer(),) ,
                shimmerWidget: CustomShimmerList(itemShimmer: SubjectShimmer(),) ,
                emptyParams: EmptyParams(
                    text: 'empty subject',
                    caption: '',
                    image: ICONS.internalServerError),
                successWidget: SubjectList(controller),
                retry: () {
                  controller.fetchCourseLearning();
                },
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SliverList SubjectList(SubjectController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.courseLearningModel.length,
        (context, index) => ItemSubject(
            textSubject: controller.courseLearningModel[index].title,
            pageCount: controller.courseLearningModel[index].pagesCount,
            questionCount: controller.courseLearningModel[index].countQuestions,
            onTap: () {
              // Get.toNamed(Routes.getExerciseSubjectScreen());
            }),
      ),
    );
  }
}
