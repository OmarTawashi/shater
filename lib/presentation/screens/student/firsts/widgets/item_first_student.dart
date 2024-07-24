import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/data/model/student_model.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class ItemFirstStudents extends StatelessWidget {
  final StudentModel? student;
  final int? index;
  const ItemFirstStudents({super.key, this.student, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize5.h),
      child: Row(
        children: [
          Container(
            padding: index! > 9
                ? const EdgeInsets.fromLTRB(10, 26, 10, 26)
                : const EdgeInsets.fromLTRB(16, 26, 16, 26),
            margin: const EdgeInsets.only(right: Dimensions.paddingSize16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: COLORS.primaryColor,
            ),
            child: CustomText(
              text: "${index}",
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: Dimensions.fontSize16.sp,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: COLORS.primaryColor),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        child: CachedNetworkImageWidget(
                          imageUrl: student?.student?.image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextStudentInfo(
                                  textTitle: student?.student?.name,
                                  title: 'الطالب',
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextStudentInfo(
                                  textTitle: student?.school?.name,
                                  title: 'المدرسة',
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextStudentInfo(
                                  textTitle: student?.city?.name,
                                  title: 'المنطقة',
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: "${student?.score}",
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSize14.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: Dimensions.paddingSize8,
                      ),
                      CustomSvgPicture(assetName: ICONS.star),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextStudentInfo extends StatelessWidget {
  final String? title;
  final Color titleColor;
  final String? textTitle;
  final Color? textTitleColor;

  const TextStudentInfo(
      {super.key,
      this.textTitle,
      this.titleColor = Colors.white,
      this.textTitleColor,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: title!.tr + ":\t",
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSize13,
          maxLine: 1,
          color: titleColor,
          overFlow: TextOverflow.ellipsis,
        ),
        CustomText(
          text: textTitle ?? '',
          fontWeight: FontWeight.bold,
          overFlow: TextOverflow.ellipsis,
          maxLine: 1,
          fontSize: Dimensions.fontSize14,
          color: textTitleColor ?? Color.fromRGBO(205, 223, 235, 1),
        )
      ],
    );
  }
}
