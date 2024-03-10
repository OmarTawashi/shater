import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/custom_shimmer_list.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/perfect_app_bar.dart';
import 'package:shater/presentation/screens/student/exercises/controller/exercise_controller.dart';
import 'package:shater/presentation/screens/student/exercises/widgets/exercise_shimmer.dart';
import 'package:shater/presentation/screens/student/exercises/widgets/item_exercise.dart';

import '../../../../../util/images.dart';
import '../../../base/tap_section.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PerfectAppBar(),
      body: GetBuilder<ExerciseController>(
        builder: (controller) => RefreshIndicator.adaptive(
          color: Colors.black,
          onRefresh: () async {
            controller.fetchCourseLearning();
          },
          child: CustomScrollView(
            slivers: [
              IntikeTapBar(
                assetName: ICONS.exerciseTop,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TapSection(
                      isSelected:
                          (controller.selectExercise == TabExercise.exercied),
                      onTap: () {
                        controller.changeSection(TabExercise.exercied);
                      },
                      text: TabExercise.exercied.name.tr,
                    ),
                    TapSection(
                      isSelected: (controller.selectExercise ==
                          TabExercise.exerciedTeachers),
                      onTap: () {
                        controller.changeSection(TabExercise.exerciedTeachers);
                      },
                      text: TabExercise.exerciedTeachers.name.tr,
                    ),
                  ],
                ),
              ),
              AnimatorContainer(
                viewType: controller.viewType,
                isSliver: true,
                emptyParams: EmptyParams(
                    text: 'first_student',
                    caption: 'empty_first_student',
                    image: ICONS.exerciseTop),
                shimmerWidget: CustomShimmerList(
                  itemShimmer: ExerciseShimmer(),
                ),
                errorWidget: CustomEmptyView(
                  assetName: ICONS.exerciseTop,
                  primaryText: 'EXercise',
                  secanderyText: 'error_for_get_exercise',
                ),
                successWidget: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: controller.courseLearningModel.length,
                    (context, index) => ItemExercise(
                      imageUrl: controller.courseLearningModel[index].image,
                      subjectText: controller.courseLearningModel[index].title,
                      trainingNumber:
                          controller.courseLearningModel[index].countQuestions,
                    ),
                  ),
                ),
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
}
