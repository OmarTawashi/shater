import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/perfect_app_bar.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';
import 'package:shater/presentation/screens/student/teacher/controller/teacher_controller.dart';
import 'package:shater/presentation/screens/student/teacher/widget/body_teacher_widget.dart';
import 'package:shater/presentation/screens/student/teacher/widget/header_teacher_widget.dart';
import 'package:shater/presentation/screens/student/teacher/widget/teacher_list.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PerfectAppBar(),
      body: GetBuilder<TeacherController>(
        builder: (controller) => RefreshIndicator.adaptive(
          onRefresh: () async {
            controller.iniGetSubject();
            controller.getTeachers();
          },
          child: CustomScrollView(
            slivers: [
              IntikeTapBar(
                assetName: ICONS.teacherTop,
                child: Row(
                  children: [
                    TapSection(
                      isSelected:
                          controller.teacherTapSelected == TeacherTap.teachers,
                      onTap: () {
                        controller.changeTap(TeacherTap.teachers);
                        controller.getData(controller.teacherTapSelected);
                      },
                      text: 'teachers'.tr,
                    ),
                    TapSection(
                      isSelected: controller.teacherTapSelected ==
                          TeacherTap.subscriptions,
                      onTap: () {
                        controller.changeTap(TeacherTap.subscriptions);
                        controller.getData(controller.teacherTapSelected);
                      },
                      text: 'subscriptions'.tr,
                    ),
                  ],
                ),
              ),
              getHeaderWidget(controller),
              getBodyWidget(controller),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeaderWidget(TeacherController controller) {
    switch (controller.teacherTapSelected) {
      case TeacherTap.teachers:
        return HeaderTeacherWidget(
          controller: controller,
        );
      case TeacherTap.subscriptions:
        return SliverToBoxAdapter();
      default:
        return HeaderTeacherWidget(
          controller: controller,
        );
    }
  }

  Widget getBodyWidget(TeacherController controller) {
    switch (controller.teacherTapSelected) {
      case TeacherTap.teachers:
        return BodyTeacherWidget(controller: controller);
      case TeacherTap.subscriptions:
        return SliverToBoxAdapter();
      default:
        return BodyTeacherWidget(controller: controller);
    }
  }
}
