import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/custom_shimmer_list.dart';
import 'package:shater/presentation/screens/student/subject/widgets/shimmer_subject.dart';
import 'package:shater/presentation/screens/teacher/My%20Explanation/teacher_my_lessons_controller.dart';
import 'package:shater/presentation/screens/teacher/Teacher%20Pages%20Explained/teacher_pages_lessons_controller.dart';
import 'package:shater/presentation/screens/teacher/Teacher%20Pages%20Explained/view/teacher_item_page_lesson.dart';
import 'package:shater/util/images.dart';
import '../../../../util/color.dart';
import '../../../../util/dimensions.dart';
import '../../base/animator_container.dart';
import '../../student/exercise subject/view/exercise_subject_screen.dart';

class TeacherPagesLessonsScreen extends StatelessWidget {
  const TeacherPagesLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GetBuilder<TeacherPagesLessonsController>(
        builder: (controller) => RefreshIndicator.adaptive(
          color: Colors.black,
          onRefresh: () async {
            controller.fetchTeacherCoursesLesson();
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                leadingWidth: 140,
                toolbarHeight: 130,
                backgroundColor: COLORS.primaryColor,
                automaticallyImplyLeading: false,
                excludeHeaderSemantics: true,
                leading: IconTextCont(
                  text: Get.find<TeacherMyLessonsController>()
                          .selectedCourse
                          ?.title ??
                      'sss',
                ),
                centerTitle: true,
                title: Container(
                  margin: const EdgeInsets.only(
                      top: 50, bottom: Dimensions.paddingSize25 + 15),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: Image.asset(
                    ICONS.book,
                    fit: BoxFit.cover,
                  ),
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
                  primaryText: 'subjects'.tr,
                  secanderyText: 'error_for_get_subject'.tr,
                ),
                shimmerWidget: CustomShimmerList(
                  itemShimmer: SubjectShimmer(),
                ),
                emptyParams: EmptyParams(
                    text: 'subjects',
                    caption: 'empty_subject',
                    image: ICONS.decriptionTop),
                successWidget: SubjectList(controller),
                retry: () {
                  controller.fetchTeacherCoursesLesson();
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

  SliverList SubjectList(TeacherPagesLessonsController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.subjects.length,
        (context, index) {
          var item = controller.subjects[index];
          return TeacherItemPageLesson(
            textSubject: "item.title",
            classes: item.classes,
            teacherCountVideo: controller.subjects[index].teacherCountVideo,
            imageUrl: controller.subjects[index].image,
            onTap: () async {

              print("goooooooooooooooooooo");

            },
          );
        },
      ),
    );
  }
}
