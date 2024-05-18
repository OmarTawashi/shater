import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/custom_shimmer_list.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/exercises/controller/exercise_controller.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/exercises/widgets/exercise_shimmer.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';
import 'package:shater/presentation/screens/student/subject/widgets/item_exercise.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/images.dart';

class ExerciseWidget extends StatelessWidget {
  final SubjectController controller;
  const ExerciseWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatorContainer(
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
            onTap: () {
              controller.setCourse(controller.courseLearningModel[index]);
              Get.toNamed(Routes.getPageSubjectScreen());
            },
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
    );
  }
}
