

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';

import '../../../../../data/model/student_model.dart';
import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';

import '../../../base/text_custom.dart';

class SubscribersItem extends StatelessWidget {
  final StudentModel? student;
  final int? index;
  const SubscribersItem({super.key, this.student, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize8.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: COLORS.primaryColor),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(width: 2,color: COLORS.backGroundColor)),
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
                                CustomText(
                                  text: student?.school?.name ?? '-',
                                  fontWeight: FontWeight.bold,
                                  overFlow: TextOverflow.ellipsis,
                                  maxLine: 1,
                                  fontSize: Dimensions.fontSize16.sp,
                                  color: COLORS.whiteColor,
                                )
                                ,
                                SizedBox(
                                  height: 5,
                                ),
                                TextStudentInfo(
                                  textTitle: student?.school?.name ?? "-",
                                  title: 'المدرسة',
                                  fontSize: Dimensions.fontSize12.sp,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextStudentInfo(
                                  textTitle: student?.city?.name ?? "-",
                                  title: 'المنطقة',
                                  fontSize: Dimensions.fontSize12.sp,
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
                      Column(
                        children: [
                          CustomText(
                            text: "شهر/تبدأمن",
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSize12.sp,
                            color: COLORS.textLightColor,
                          ),
                          SizedBox(height: 6),
                          CustomText(
                            text: "${"23/3/2024"}",
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.fontSize14.sp,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: COLORS.whiteColor,
                        size: 20,
                      )
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
  final double fontSize;


   TextStudentInfo(
      {super.key,
      this.textTitle,
      this.titleColor = Colors.white,
      this.textTitleColor,
      this.title,
        this.fontSize = Dimensions.fontSize10}
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: title!.tr + ":\t",
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          maxLine: 1,
          color: titleColor,
          overFlow: TextOverflow.ellipsis,
        ),
        CustomText(
          text: textTitle ?? '',
          fontWeight: FontWeight.bold,
          overFlow: TextOverflow.ellipsis,
          maxLine: 1,
          fontSize: Dimensions.fontSize11.sp,
          color: textTitleColor ?? Color.fromRGBO(205, 223, 235, 1),
        )
      ],
    );
  }
}
