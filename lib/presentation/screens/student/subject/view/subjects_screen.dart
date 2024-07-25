import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/subject/controller/subjects_controller.dart';
import 'package:shater/presentation/screens/student/subject/widgets/exercise_widget.dart';
import 'package:shater/presentation/screens/student/subject/widgets/subject_widget.dart';
import 'package:shater/util/images.dart';
import '../../../base/intike_tab_bar.dart';
import '../../../base/perfect_app_bar.dart';
import '../../../base/tap_section.dart';

class SubjectsSCreen extends StatelessWidget {
  const SubjectsSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PerfectAppBar(),
      body: GetBuilder<SubjectController>(
        builder: (controller) => RefreshIndicator.adaptive(
          color: Colors.black,
          onRefresh: () async {
            controller.getData(controller.subjectTapSelected);
          },
          child: CustomScrollView(
            slivers: [
              IntikeTapBar(
                assetName: ICONS.decriptionTop,
                child: Row(
                  children: [
                    TapSection(
                      isSelected:
                          controller.subjectTapSelected == SubjectTap.lessons,
                      onTap: () {
                        controller.changeTap(SubjectTap.lessons);
                        controller.getData(controller.subjectTapSelected);
                      },
                      text: 'subjects'.tr,
                    ),
                    TapSection(
                      isSelected:
                          controller.subjectTapSelected == SubjectTap.execise,
                      onTap: () {
                        controller.changeTap(SubjectTap.execise);
                        controller.getData(controller.subjectTapSelected);
                      },
                      text: 'exercise'.tr,
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              getBodyView(controller),
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

  Widget getBodyView(SubjectController controller) {
    switch (controller.subjectTapSelected) {
      case SubjectTap.lessons:
        return SubjectWidget(controller: controller);
      case SubjectTap.execise:
        return ExerciseWidget(controller: controller);
      default:
        return SubjectWidget(controller: controller);
    }
  }
}
