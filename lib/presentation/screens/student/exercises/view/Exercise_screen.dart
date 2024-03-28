import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/perfect_app_bar.dart';
import 'package:shater/presentation/screens/student/exercises/controller/exercise_controller.dart';
import 'package:shater/presentation/screens/student/exercises/widgets/exercise_teacher_widget.dart';
import 'package:shater/presentation/screens/student/exercises/widgets/exercise_widget.dart';

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
              selectable(controller),
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

  Widget selectable(ExerciseController controller) {
    switch (controller.selectExercise) {
      case TabExercise.exercied:
        return ExerciseWidget(
          controller: controller,
        );
      case TabExercise.exerciedTeachers:
        return ExerciseTeacherWidget(
          controller: controller,
        );
      default:
        return ExerciseWidget(
          controller: controller,
        );
    }
  }
}
