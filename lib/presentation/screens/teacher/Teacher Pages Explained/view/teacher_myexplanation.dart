import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/exercise%20subject/view/exercise_subject_screen.dart';
import 'package:shater/presentation/screens/student/exercise%20subject/widgets/item_exercise_subject.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';
import '../../../../../util/dimensions.dart';
import '../../../teacher/Teacher Pages Explained/teacher_pages_lessons_controller.dart';

class TeacheMyExplanationScreen extends StatelessWidget {
  const TeacheMyExplanationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          leadingWidth: 140,
          toolbarHeight: 130,
          backgroundColor: COLORS.primaryColor,
          automaticallyImplyLeading: false,
          excludeHeaderSemantics: true,
          leading: IconTextCont(
            text: "myexplanation".tr,
          ),
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
        const SliverToBoxAdapter(
          child: SizedBox(
            height: Dimensions.paddingSize16,
          ),
        ),
        GetBuilder<TeacherPagesLessonsController>(
          builder: (controller) => SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.5,
              mainAxisSpacing: Dimensions.paddingSize16,
              mainAxisExtent: 150,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ItemExerciseSubject(
                  index: index,
                  onTap: () {},
                  image: controller.vedioSubjectTeacher[index].url,
                  pageNo: controller.vedioSubjectTeacher[index].page!.pageNo
                      .toString(),

                  // pageNo: controller.vedioSubjectTeacher[index].page!.pageNo
                  //     .toString(),
                  subText:
                      controller.vedioSubjectTeacher[index].page!.isExplain!
                          ? "explan".tr
                          : "notexplan".tr,
                );
              },
              childCount: controller.vedioSubjectTeacher.length,
            ),
          ),
        ),
      ],
    ));
  }
}
