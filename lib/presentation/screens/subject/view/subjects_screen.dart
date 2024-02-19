import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/subject/controller/subjects_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/images.dart';

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
              assetName: ICONS.teachersTopBar,
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 5,
                (context, index) => ItemSubject(
                  onTap: () {
                    Get.toNamed(Routes.getExerciseSubjectScreen());
                  }
                ),
              ),
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
}


