import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';
import '../../../../../util/dimensions.dart';
import '../../../base/custom_intike_container.dart';
import '../../../base/text_custom.dart';
import '../../../teacher/Explanation/teacher_explanation_controller.dart';
import '../widgets/item_exercise_subject.dart';

class ExerciseSubjectScreen extends StatelessWidget {
  const ExerciseSubjectScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     Get.put(TeacherExplanationController());
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
                text:
                     "myexplanation".tr,
                    // Get.find<TeacherMyLessonsController>()
                    //         .selectedCourse
                    //         ?.title ??
                    //     ""
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
          GetBuilder<TeacherExplanationController>(
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
                    image: controller.subjectPagesModel.items?[index].image??"",
                    pageNo: controller.subjectPagesModel.items?[index].pageNo
                        .toString()??"0",
                    subText:
                        controller.subjectPagesModel.items?[index].isExplain??true
                            ? "explaned".tr
                            : "اشرح",
                  );
                },
                childCount: controller.subjectPagesModel.items?.length??2,
              ),
            ),
          ),
     
        ],
      ),
    );
  }
}

class IconTextCont extends StatelessWidget {
  final String text;
  const IconTextCont({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 62),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(Routes.getTeacherDashBoardScreen());
        },
        child: CustomIntikeContainer(
          paddingHorizontal: Dimensions.paddingSize12,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.arrow_back_ios_new_sharp,
                  color: Colors.white, size: 18),
              const SizedBox(
                width: Dimensions.paddingSize10,
              ),
              CustomText(
                text: text,
                color: Colors.white,
                fontSize: Dimensions.fontSize14,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
