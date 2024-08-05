import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/presentation/screens/student/exercise%20subject/widgets/item_exercise_subject.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';

import '../../../../../core/controller/shared_prefrences.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/custom_empty_view.dart';
import '../../../base/custom_shimmer_list.dart';
import '../../../student/exercise subject/view/exercise_subject_screen.dart';
import '../../../student/subject/widgets/shimmer_subject.dart';
import '../../../teacher/Explanation/teacher_explanation_controller.dart';
import '../../My Explanation/teacher_my_lessons_controller.dart';
import 'add_excercise/bootom_sheet_widget.dart';

class TeacherExerciseSubjectScreen extends StatelessWidget {
  TeacherExerciseSubjectScreen({
    super.key,
  });
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TeacherExplanationController>(
        builder: (controller) {
          if (controller.viewType == ViewType.success) {
            return CustomScrollView(
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
                          ""),
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
                IntikeTapBar(
                  assetName: ICONS.explanationTop,
                  with_picture: false,
                  height: 100,
                  child: Row(
                    children: [
                      TapSection(
                        isSelected: true,
                        text: 'انشاء شروح وتدريبات'.tr,
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: Dimensions.paddingSize16,
                  ),
                ),
                controller.viewType == ViewType.success
                    ? SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.5,
                          mainAxisSpacing: Dimensions.paddingSize16,
                          mainAxisExtent: 150,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return AnimatorContainer(
                              viewType: controller.viewType,
                              isSliver: true,
                              errorWidget: CustomEmptyView(
                                assetName: ICONS.decriptionTop,
                                primaryText: 'subjects',
                                secanderyText: 'error_for_get_subject',
                              ),
                              shimmerWidget: CustomShimmerList(
                                itemShimmer: SubjectShimmer(),
                              ),
                              emptyParams: EmptyParams(
                                  text: 'subjects'.tr,
                                  caption: 'empty_subject'.tr,
                                  image: ICONS.decriptionTop),
                              successWidget: ItemExerciseSubject(
                                index: index,
                                image: controller
                                    .subjectPagesModel.items![index].image,
                                pageNo: controller
                                    .subjectPagesModel.items![index].pageNo
                                    .toString(),
                                subText: controller.subjectPagesModel
                                        .items![index].isExplain!
                                    ? "explan".tr
                                    : "lets_explain".tr,
                                color: controller.subjectPagesModel
                                        .items![index].isExplain!
                                    ? COLORS.secanderyColor
                                    : null,
                                onTap: controller.subjectPagesModel
                                        .items![index].isExplain!
                                    ? () {}
                                    : () {
                                        print(SharedPrefs
                                            .user!.canCreateQuestion!);
                                        showModalBottomSheet(
                                          isDismissible: true,
                                          constraints: BoxConstraints(
                                            maxHeight: 300.h,
                                          ),
                                          context: context,
                                          builder: (context) =>
                                              BottomSheetWidget(
                                            subject_id: controller
                                                .subjectPagesModel
                                                .items![index]
                                                .subjectId!,
                                            image: controller.subjectPagesModel
                                                .items![index].image!,
                                            page_number: controller
                                                .subjectPagesModel
                                                .items![index]
                                                .pageNo!
                                                .toString(),
                                            canCreateQuestion: SharedPrefs
                                                .user!.canCreateQuestion!,
                                          ),
                                        );
                                      },
                              ),
                            );
                          },
                          childCount:
                              controller.subjectPagesModel.items!.length,
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: COLORS.secanderyColor,
                        ),
                      ),
              ],
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
