import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/base/widget/bottom_widget_lesson.dart';
import 'package:shater/presentation/screens/student/questions/lesson/controller/lesson_controller.dart';
import 'package:shater/presentation/screens/student/questions/lesson/view/lesson_view.dart';
import 'package:shater/util/color.dart';

class LessonTeacherView extends StatelessWidget {
  const LessonTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.secanderyColor,
      bottomNavigationBar: BottomTeacherWidget(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: ButtonBack(),
        centerTitle: true,
        title: CustomText(
          text:
              Get.find<LessonController>().videoPageSelected?.user?.name ?? '',
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 17.5,
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 20,
              child: CachedNetworkImageWidget(
                imageUrl: Get.find<LessonController>()
                        .videoPageSelected
                        ?.user
                        ?.image ??
                    '',
                fit: BoxFit.cover,
                height: 40,
                width: 40,
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<LessonController>(
          builder: (controller) => Column(
                children: [
                  BodyLessonTeacher(controller: controller),
                ],
              )),
    );
  }
}
