import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/custom_shimmer_list.dart';
import 'package:shater/presentation/screens/student/subject/widgets/shimmer_subject.dart';
import 'package:shater/presentation/screens/teacher/Explanation/teacher_explanation_controller.dart';
import 'package:shater/presentation/screens/teacher/Explanation/view/teacher_item_subject.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/images.dart';
import '../../../base/animator_container.dart';
import '../../../base/intike_tab_bar.dart';
import '../../../base/perfect_app_bar.dart';
import '../../../base/tap_section.dart';
import '../../My Explanation/teacher_my_lessons_controller.dart';

class TeacherExplanationScreen extends StatelessWidget {
  const TeacherExplanationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PerfectAppBar(),
      body: GetBuilder<TeacherExplanationController>(
        builder: (controller) => RefreshIndicator.adaptive(
          color: Colors.black,
          onRefresh: () async {
            controller.teacherCoursesList();
          },
          child: CustomScrollView(
            slivers: [
              IntikeTapBar(
                assetName: ICONS.explanationTop,
                child: Row(
                  children: [
                    TapSection(
                      isSelected: true,
                      text: 'explanations'.tr,
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
                  assetName: ICONS.decriptionTop,
                  primaryText: 'subjects',
                  secanderyText: 'error_for_get_subject',
                ),
                shimmerWidget: CustomShimmerList(
                  itemShimmer: SubjectShimmer(),
                ),
                emptyParams: EmptyParams(
                    text: 'subjects'.tr,
                    caption: 'empty_subject'.tr,
                    image: ICONS.decriptionTop),
                successWidget: SubjectList(controller),
                retry: () {
                  controller.teacherCoursesList();
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

  SliverList SubjectList(TeacherExplanationController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.subjects.length,
        (context, index) {
          var item = controller.subjects[index];
          return TeacherItemSubject(
            textSubject: item.title,
            classes: item.classes,
            teacherCountVideo: controller.subjects[index].teacherCountVideo,
            imageUrl: controller.subjects[index].image,
            onTap: () async {
              await controller.getTeacherCoursesExercisesList(
                  course_id: controller.subjects[index].id!);

              await Get.find<TeacherMyLessonsController>()
                  .setCourse(controller.subjects[index]);
              Get.toNamed(Routes.getTeacherExerciseSubjectScreen());
            },
          );
        },
      ),
    );
  }
}
