import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';
import 'package:shater/util/images.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ResultSubjectScreen extends StatelessWidget {
  const ResultSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
        centerTitle: true,
        title: CustomText(
          text: 'محمد جمعه',
          color: Colors.white,
          textAlign: TextAlign.end,
          fontSize: Dimensions.fontSize24.sp,
          fontWeight: FontWeight.w400,
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
            child: CircleAvatar(
              radius: 20,
              child: Image.asset(
                IMAGES.firstImages,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: Dimensions.paddingSize10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize12 + 2,
                    vertical: Dimensions.paddingSize25 + 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(13),
                    bottom: Radius.circular(5),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 33,
                    ),
                    SizedBox(
                      width: Dimensions.paddingSize5,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'الرياضيات',
                                    color: Color.fromRGBO(85, 85, 85, 1),
                                    fontSize: Dimensions.fontSize24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  CustomText(
                                    text: 'الاسبوع الماضي',
                                    color: Color.fromRGBO(118, 123, 127, 1),
                                    fontSize: Dimensions.fontSize15,
                                    fontWeight: FontWeight.w300,
                                  )
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: Dimensions.paddingSize10,
                                    horizontal: Dimensions.paddingSize16),
                                decoration: BoxDecoration(
                                    color: COLORS.secanderyColor,
                                    borderRadius: BorderRadius.circular(24)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomSvgPicture(
                                      assetName: ICONS.subjectTapActive,
                                      height: 16,
                                      width: 16,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: Dimensions.paddingSize5,
                                    ),
                                    CustomText(
                                      text: '12' + "\t" + "exercise".tr,
                                      color: Colors.white,
                                      fontSize: Dimensions.fontSize12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.paddingSize5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 180.w,
                                child: Transform(
                                  transform: Matrix4.rotationY(pi),
                                  alignment: Alignment.center,
                                  child: FAProgressBar(
                                    currentValue: 30,
                                    borderRadius: BorderRadius.circular(30),
                                    backgroundColor:
                                        Color.fromRGBO(235, 241, 246, 1),
                                    progressColor: COLORS.secanderyColor,
                                    maxValue: 150,
                                    size: 13,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: CustomText(
                                  text: "30" "\t/\t" '150',
                                  textAlign: TextAlign.end,
                                  color: COLORS.secanderyColor,
                                  fontSize: Dimensions.fontSize18,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.paddingSize8,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize12 + 2,
                    vertical: Dimensions.paddingSize25 + 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(13),
                    top: Radius.circular(5),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SimpleCircularProgressBar(
                          valueNotifier: ValueNotifier(50),
                          maxValue: 100,
                          size: 150,
                          backColor: Color.fromRGBO(235, 241, 246, 1),
                          progressColors: [COLORS.secanderyColor],
                          fullProgressColor: COLORS.secanderyColor,
                          backStrokeWidth: 7,
                          progressStrokeWidth: 13,
                          mergeMode: true,
                          onGetText: (double value) {
                            TextStyle centerTextStyle = TextStyle(
                              fontSize: 30,
                              fontFamily: FontStyleConstant.familyFont,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(118, 123, 127, 1),
                            );

                            return Text(
                              '${value.toInt()}%',
                              style: centerTextStyle,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: "30",
                              textAlign: TextAlign.end,
                              color: Color.fromRGBO(118, 123, 127, 1),
                              fontSize: Dimensions.fontSize18 + 2,
                              fontWeight: FontWeight.w200,
                            ),
                            SizedBox(
                              height: Dimensions.paddingSize8,
                            ),
                            CustomText(
                              text: "of_page".tr,
                              textAlign: TextAlign.end,
                              color: Color.fromRGBO(118, 123, 127, 1),
                              fontSize: Dimensions.fontSize18 + 2,
                              fontWeight: FontWeight.w200,
                            ),
                          ],
                        ),
                        Container(
                          width: 5,
                          height: 70,
                          color: Color.fromRGBO(235, 241, 246, 1),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: "150",
                              textAlign: TextAlign.end,
                              color: Color.fromRGBO(118, 123, 127, 1),
                              fontSize: Dimensions.fontSize18 + 2,
                              fontWeight: FontWeight.w200,
                            ),
                            SizedBox(
                              height: Dimensions.paddingSize8,
                            ),
                            CustomText(
                              text: "to_page".tr,
                              textAlign: TextAlign.end,
                              color: Color.fromRGBO(118, 123, 127, 1),
                              fontSize: Dimensions.fontSize18 + 2,
                              fontWeight: FontWeight.w200,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleProgressWithTextWidget(
                          text: "correct_answer",
                          colorProgress: Color.fromRGBO(83, 199, 201, 1),
                        ),
                        CircleProgressWithTextWidget(
                          text: "wrong_answer",
                          colorProgress: Color.fromRGBO(252, 97, 79, 1),
                        ),
                        CircleProgressWithTextWidget(
                          text: "use_answer", //253, 166, 65
                          colorProgress: Color.fromRGBO(253, 166, 65, 1),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    //  color: COLORS.secanderyColor,

                    Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: CupertinoButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          color: COLORS.secanderyColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomText(
                                  text: 'share_result'.tr,
                                  color: Colors.white,
                                  fontSize: 20,
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.ios_share_rounded,
                                color: Colors.white,
                                size: 30,
                                weight: 40,
                              )
                            ],
                          ),
                          onPressed: () {},
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleProgressWithTextWidget extends StatelessWidget {
  final String? text;
  final Color? colorProgress;
  const CircleProgressWithTextWidget(
      {super.key, this.text, this.colorProgress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SimpleCircularProgressBar(
          valueNotifier: ValueNotifier(30),
          maxValue: 100,
          size: 92,
          backColor: Color.fromRGBO(235, 241, 246, 1),
          fullProgressColor: colorProgress,
          progressColors: [colorProgress ?? Colors.black],
          backStrokeWidth: 8.5,
          progressStrokeWidth: 8.5,
          mergeMode: true,
          onGetText: (double value) {
            TextStyle centerTextStyle = TextStyle(
              fontSize: 25,
              fontFamily: FontStyleConstant.familyFont,
              fontWeight: FontWeight.bold,
              color: colorProgress,
            );

            return Text(
              '${15}',
              style: centerTextStyle,
            );
          },
        ),
        SizedBox(
          height: Dimensions.paddingSize10,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 11,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color.fromRGBO(235, 241, 246, 1)),
          child: CustomText(
            text: text!.tr,
            textAlign: TextAlign.end,
            color: Color.fromRGBO(118, 123, 127, 1),
            fontSize: Dimensions.fontSize14,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
