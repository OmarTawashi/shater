import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';

import '../../../../../util/dimensions.dart';
import '../../../base/custom_intike_container.dart';
import '../../../base/text_custom.dart';
import '../widgets/item_exercise_subject.dart';

class ExerciseSubjectScreen extends StatelessWidget {
  const ExerciseSubjectScreen({super.key});

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
            text: 'رياضيات',
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
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.5,
            mainAxisSpacing: Dimensions.paddingSize16,
            mainAxisExtent: 190,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ItemExerciseSubject(
                index: index,
              );
            },
            childCount: 10,
          ),
        ),
      ],
    ));
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
          Get.back();
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
