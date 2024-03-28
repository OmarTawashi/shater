import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/exercises/controller/exercise_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class ExerciseTeacherWidget extends StatelessWidget {
  final ExerciseController controller;
  const ExerciseTeacherWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(color: COLORS.backGroundColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'show_just_question_of_teacher_sub',
                  fontSize: Dimensions.fontSize14,
                  textAlign: TextAlign.center,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: Dimensions.paddingSize16,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSize16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.amber,
                            ),
                            SizedBox(
                              width: Dimensions.paddingSize16,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: 'محمد حسن القاضي',
                                  fontSize: Dimensions.fontSize15,
                                  color: Colors.black,
                                  maxLine: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: 'اليوم',
                                  fontSize: Dimensions.fontSize14,
                                  color: Colors.grey,
                                  maxLine: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: Dimensions.paddingSize16,
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.amber,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.paddingSize12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSize20,
                                    vertical: Dimensions.paddingSize12 + 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: COLORS.secanderyColor,
                                        width: 2.5)),
                                child: CustomText(
                                  text: '14',
                                  fontSize: Dimensions.fontSize18,
                                  color: COLORS.secanderyColor,
                                  maxLine: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.paddingSize12,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 43,
                              color: COLORS.secanderyColor,
                              weight: 10,
                            ),
                            SizedBox(
                              width: Dimensions.paddingSize12,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSize20,
                                    vertical: Dimensions.paddingSize12 + 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: COLORS.secanderyColor,
                                        width: 2.5)),
                                child: CustomText(
                                  text: '14',
                                  fontSize: Dimensions.fontSize18,
                                  color: COLORS.secanderyColor,
                                  maxLine: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.paddingSize16,
                        ),
                        CustomCupertinoButton(
                          color: COLORS.secanderyColor,
                          text: 'exercied',
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: Dimensions.paddingSize16,
                  ),
              itemCount: 4)
        ],
      ),
    );
  }
}