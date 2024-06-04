import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/extenstion/lesson_extention.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/student/questions/lesson/controller/lesson_controller.dart';
import 'package:shater/presentation/screens/student/questions/lesson/widget/teacher_lesson_item.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';
import 'package:video_player/video_player.dart';

class LessonView extends StatelessWidget {
  const LessonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonController>(
      builder: (controller) => getBodyWidget(controller),
    );
  }

  Widget BodyExercise(LessonController controller) {
    return Container(
      height: Get.height,
      decoration: BoxDecoration(color: COLORS.secanderyColor),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: Dimensions.paddingSize16,
          ),
          AnimatorContainer(
            viewType: controller.viewType,
            isSliver: false,
            errorWidget: Center(
              child: CustomEmptyView(
                assetName: ICONS.lessonVideos,
                primaryText: 'lessons',
                secanderyText: 'error_for_get_lessons',
              ),
            ),
            emptyParams: EmptyParams(
                text: 'lessons'.tr,
                caption: 'empty_lessons'.tr,
                image: ICONS.decriptionTop),
            successWidget: ListView.separated(
              itemCount: controller.videoPage.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: Dimensions.paddingSize16,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return TeacherExercise(
                  teacherEercise: controller.videoPage[index],
                  onTap: () {
                    controller.setVideoPage(controller.videoPage[index]);
                    Get.toNamed(Routes.getLessonTeacherView());
                  },
                );
              },
            ),
            retry: () {
              controller.fetchVideoPage();
            },
          ),
          SizedBox(
            height: 160.h,
          )
        ],
      ),
    );
  }

  getBodyWidget(LessonController controller) {
    switch (controller.route) {
      case RoutesName.pageSubjectScreen:
        return BodyExercise(controller);
      case RoutesName.subcriptionTeacherDetailsScreen:
        return BodyLessonTeacher(controller: controller);
      default:
        return BodyExercise(controller);
    }
  }
}

class BodyLessonTeacher extends StatelessWidget {
  final LessonController controller;
  const BodyLessonTeacher({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FutureBuilder(
          future: controller.initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SizedBox(
                  height: controller.route == RoutesName.pageSubjectScreen
                      ? Get.height * 0.78
                      : Get.height * 0.71,
                  width: Get.width,
                  child: VideoPlayer(controller.videoController));
            } else {
              return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            }
          },
        ),
        Positioned(
          top: Get.height * 0.35,
          child: IconButton(
            icon: Icon(
              controller.videoController.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
              size: 40,
            ),
            onPressed: () {
              controller.powerVideo();
            },
          ),
        ),
      ],
    );
  }
}
