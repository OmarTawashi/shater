import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/views/screens/base/intike_tab_bar.dart';
import 'package:shater/views/screens/exercises/controller/exercise_controller.dart';
import 'package:shater/views/screens/exercises/widgets/item_exercise.dart';

import '../../../../util/images.dart';
import '../../base/perfect_app_bar.dart';
import '../../base/tap_section.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ExerciseController>(
        builder: (controller) => CustomScrollView(
          slivers: [
            const PerfectAppBar(),
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 5,
                (context, index) => ItemExercise(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
