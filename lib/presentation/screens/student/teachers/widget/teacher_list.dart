import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/teachers/controller/teacher_controller.dart';
import 'package:shater/presentation/screens/student/teachers/widget/item_teacher.dart';
import 'package:shater/routes/app_routes.dart';

class TeacherList extends StatelessWidget {
  final TeacherController controller;
  const TeacherList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.teachers.length,
        (context, index) => ItemTeacher(
          onTap: () {
            controller.setTeacher(controller.teachers[index]);
            controller.sendReadTeacher(controller.teachers[index].id);
            Get.toNamed(Routes.getTeacherDetailsScreen());

            // Get.toNamed(
            //   Routes.getSubcriptionTeacherDetailsScreen(),
            // );
          },
          imageUrl: controller.teachers[index].image,
          name: controller.teachers[index].name,
          subject: '', //
          imageSubjectUrl: controller.courseSelected?.image,
          teacherStar: controller.teachers[index].rate.toString(),
        ),
      ),
    );
  }
}
