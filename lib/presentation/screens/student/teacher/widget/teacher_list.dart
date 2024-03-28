import 'package:flutter/widgets.dart';
import 'package:shater/presentation/screens/student/teacher/controller/teacher_controller.dart';
import 'package:shater/presentation/screens/student/teacher/widget/item_teacher.dart';

class TeacherList extends StatelessWidget {
  final TeacherController controller;
  const TeacherList({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          childCount: controller.teachers.length,
          (context, index) => ItemTeacher(
                imageUrl:
                    controller.teachers[index].image,
                name:controller.teachers[index].name,
                subject:controller.courseSelected?.title,
                imageSubjectUrl:controller.courseSelected?.image ,
                teacherStar: controller.teachers[index].rate.toString(),
              )),
    );
  }
}