import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/subject/controller/subjects_controller.dart';
import 'package:shater/util/images.dart';

import '../../base/animator_container.dart';
import '../../base/intike_tab_bar.dart';
import '../../base/perfect_app_bar.dart';
import '../../base/tap_section.dart';
import '../widgets/item_subject.dart';

class SubjectsSCreen extends StatelessWidget {
  const SubjectsSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SubjectController>(
        builder: (controller) => CustomScrollView(
          slivers: [
            const PerfectAppBar(),
            IntikeTapBar(
              assetName: ICONS.decriptionTop,
              child: Row(
                children: [
                  TapSection(
                    isSelected: true,
                    text: 'subjects'.tr,
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
              emptyParams: EmptyParams(
                  text: 'empty subject',
                  caption: '',
                  image: ICONS.internalServerError),
              successWidget: SubjectList(controller),
              retry: () {
                controller.fetchSubject();
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
    );
  }

  SliverList SubjectList(SubjectController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: controller.subjects.length,
        (context, index) => ItemSubject(
          textSubject: controller.subjects[index].title,
          pageCount: controller.subjects[index].pagesCount,
          questionCount: controller.subjects[index].countQuestions,
          onTap: () {
          // Get.toNamed(Routes.getExerciseSubjectScreen());
        }),
      ),
    );
  }
}
