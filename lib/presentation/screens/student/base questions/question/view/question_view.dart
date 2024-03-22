import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/controller/question_controller.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/widget/header_question_section.dart';
import 'package:shater/presentation/screens/student/base%20questions/question/widget/image_question_section.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class QuestionView extends StatelessWidget {
  const QuestionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      builder: (controller) => 
       SliverToBoxAdapter(
        child: Column(
          children: [
            HeaderQuestionSection(
              titleQuestion: controller.questions[1].title,
              subTitleQuestion: "كم يوجد في الصورة من عناصر",
            ),
            ImageQuestionSection(
              imageUrl: '',
            ),
            QuestionAnwserSection()
          ],
        ),
      ),
    );
  }
}

class QuestionAnwserSection extends StatelessWidget {
  const QuestionAnwserSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 0,
                    offset: Offset(0, 0))
              ]),
          child: Image.asset(IMAGES.firstImages)),
    );
  }
}
