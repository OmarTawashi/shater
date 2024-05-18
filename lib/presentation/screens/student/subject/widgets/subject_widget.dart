import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/custom_shimmer_list.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/exercises/widgets/exercise_shimmer.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';
import 'package:shater/presentation/screens/student/subject/widgets/item_subject.dart';
import 'package:shater/presentation/screens/student/subject/widgets/shimmer_subject.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/images.dart';

class SubjectWidget extends StatelessWidget {
  final SubjectController controller;
  const SubjectWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatorContainer(
      viewType: controller.viewType,
      isSliver: true,
      errorWidget: CustomEmptyView(
        assetName: ICONS.decriptionTop,
        primaryText: 'subjects',
        secanderyText: 'error_for_get_subject',
      ),
      shimmerWidget: CustomShimmerList(
        itemShimmer: ExerciseShimmer(),
      ),
      emptyParams: EmptyParams(
          text: 'subjects'.tr,
          caption: 'empty_subject'.tr,
          image: ICONS.decriptionTop),
      successWidget: SubjectList(controller),
      retry: () {
        controller.fetchCourseLearning();
      },
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
            imageUrl: controller.courseLearningModel[index].image,
            onTap: () {
              Get.toNamed(Routes.getExerciseSubjectScreen());
            }),
      ),
    );
  }
}
