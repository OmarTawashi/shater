import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shater/data/model/teacher_exercise_model.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/firsts/widgets/item_first_student.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class TeacherExercise extends StatelessWidget {
  final TeacherExerciseModel? teacherEercise;
  final Function()? onTap;
  const TeacherExercise({
    super.key,
    this.teacherEercise,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            padding: EdgeInsets.all(3.2),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                strokeAlign: BorderSide.strokeAlignOutside,
                width: 5,
              ),
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: CircleAvatar(
                child: CachedNetworkImageWidget(
                  imageUrl: teacherEercise?.user?.image ?? '',
                  fit: BoxFit.cover,
                  height: 70,
                  width: 70,
                ),
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.paddingSize10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomText(
                        text: teacherEercise?.user?.name ?? '',
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        overFlow: TextOverflow.ellipsis,
                        fontSize: 18,
                        maxLine: 1,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.favorite_border_sharp,
                            size: 26,
                            color: Colors.red[200],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.paddingSize10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStudentInfo(
                      textTitle: teacherEercise?.subject?.title ?? '-',
                      title: 'subject',
                      titleColor: Colors.grey,
                      textTitleColor: COLORS.secanderyColor,
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: COLORS.secanderyColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "${teacherEercise?.user?.countVideo ?? 0}"
                                      "\t" +
                                  "lessons".tr,
                              color: COLORS.whiteColor,
                              textAlign: TextAlign.start,
                              fontSize: Dimensions.fontSize13,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: CustomSvgPicture(assetName: ICONS.star),
                    ),
                    SizedBox(
                      width: Dimensions.paddingSize8,
                    ),
                    CustomText(
                      text:
                          "${teacherEercise?.user?.teacherRate?.toDouble() ?? 0.0}",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize14,
                      color: COLORS.secanderyColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
