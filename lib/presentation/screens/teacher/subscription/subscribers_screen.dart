import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/base/custom_shimmer_list.dart';
import 'package:shater/presentation/screens/student/subject/widgets/shimmer_subject.dart';
import 'package:shater/presentation/screens/teacher/subscription/view/subscribers_item.dart';
import 'package:shater/util/images.dart';


import '../../base/animator_container.dart';
import '../../base/intike_tab_bar.dart';
import '../../base/perfect_app_bar.dart';
import '../../base/tap_section.dart';
import 'subscribers_controller.dart';

class SubscribersScreen extends StatelessWidget {
  const SubscribersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PerfectAppBar(),
      body: GetBuilder<SubscribersController>(
        builder: (controller) => RefreshIndicator.adaptive(
          color: Colors.black,
          onRefresh: () async {
            controller.fetchTeacherCoursesLesson();
          },
          child: CustomScrollView(
            slivers: [
              IntikeTapBar(
                assetName: ICONS.subscribersTop,
                child: Row(
                  children: [
                    TapSection(
                      isSelected: true,
                      text: 'subscribers'.tr,
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
                  primaryText: 'subscribers',
                  secanderyText: 'error_for_get_subject',
                ),
                shimmerWidget: CustomShimmerList(
                  itemShimmer: SubjectShimmer(),
                ),
                emptyParams: EmptyParams(
                    text: 'subjects'.tr,
                    caption: 'empty_subject'.tr,
                    image: ICONS.decriptionTop),
                successWidget: SubscribersList(controller),
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

  SliverList SubscribersList(SubscribersController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 5 ,//controller.subjects.length
            (context, index) {
              // var item = controller.subjects[index];
              return SubscribersItem();
            },
      ),
    );
  }
}
