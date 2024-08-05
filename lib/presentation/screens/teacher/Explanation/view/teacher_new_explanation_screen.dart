import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';

import '../../../../../widgets/custom_elevated_button.dart';
import '../../../base/svgpicture_custom.dart';
import '../../../teacher/Explanation/teacher_explanation_controller.dart';
import 'add_excercise/camera_widget.dart';
import 'drawing_painter.dart';

class TeacherNewExplanationScreen extends StatefulWidget {
  final String pageImage;

  TeacherNewExplanationScreen({super.key, required this.pageImage});

  @override
  State<TeacherNewExplanationScreen> createState() =>
      _TeacherNewExplanationScreenState();
}

class _TeacherNewExplanationScreenState
    extends State<TeacherNewExplanationScreen> with TickerProviderStateMixin {
  TeacherExplanationController teacherExController =
      Get.find<TeacherExplanationController>();

  @override
  void initState() {
    super.initState();
    teacherExController.initExplanationTypeList();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003964),
      body: GetBuilder<TeacherExplanationController>(
        builder: (controller) {
          return Column(
            children: [
              Container(
                height: 130.h,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 14.w),
                color: COLORS.primaryColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 46.h,
                      width: 46.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: COLORS.whiteColor,
                          width: 3.r,
                        ),
                      ),
                      child: Visibility(
                        visible: !controller.recording,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.recording = true;
                              controller.exporting = false;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(2.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: COLORS.secanderyColor,
                            ),
                          ),
                        ),
                        replacement: GestureDetector(
                            onTap: () async {
                              setState(() {
                                controller.recording = false;
                                controller.exporting = true;
                              });
                            },
                            child: Icon(Icons.pause)),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Visibility(
                        visible: !controller.recording,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'ابدأ تسجيل الشرح',
                                style: TextStyle(
                                    color: COLORS.whiteColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              CustomSvgPicture(
                                assetName: ICONS.cancelWhite,
                                ontap: () {
                                  Get.back();
                                },
                              ),
                            ]),
                        replacement: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // if (!isEditingPen)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 40,
                                ),
                                CustomSvgPicture(
                                  assetName: ICONS.undo,
                                  ontap: () {
                                    controller.unDoPaint();
                                  },
                                ),
                                CustomSvgPicture(
                                  assetName: ICONS.redo,
                                  ontap: () {
                                    controller.reDoPaint();
                                  },
                                ),
                                CustomSvgPicture(
                                  assetName: ICONS.erase,
                                  ontap: () {
                                    controller.eraseDraw();
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.enableDraw();
                                  },
                                  child: Container(
                                      height: 46.h,
                                      width: 46.h,
                                      padding: EdgeInsets.all(8.r),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (controller.explanationType[2]
                                                      .isSelected &&
                                                  controller.canPaintBoard)
                                              ? COLORS.secanderyColor
                                              : (controller.explanationType[0]
                                                          .isSelected &&
                                                      controller.canPaintPage)
                                                  ? COLORS.secanderyColor
                                                  : COLORS.primaryColor),
                                      child: CustomSvgPicture(
                                        assetName: ICONS.draw,
                                      )),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.disableDraw();
                                  },
                                  child: Container(
                                      height: 46.h,
                                      width: 46.h,
                                      padding: EdgeInsets.all(5.r),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: (controller.explanationType[2]
                                                      .isSelected &&
                                                  !controller.canPaintBoard)
                                              ? COLORS.secanderyColor
                                              : (controller.explanationType[0]
                                                          .isSelected &&
                                                      !controller.canPaintPage)
                                                  ? COLORS.secanderyColor
                                                  : COLORS.primaryColor),
                                      child: CustomSvgPicture(
                                        assetName: ICONS.click,
                                      )),
                                ),
                              ],
                            ),

                            /*
                            if (isEditingPen)
                              SizedBox(
                                height: 32,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: avaiableColor.length,
                                  shrinkWrap: true,
                                  separatorBuilder: (_, __) {
                                    return const SizedBox(width: 8);
                                  },
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (controller
                                            .explanationType[2].isSelected) {
                                          canPaintBoard = true;

                                          boardSelectedColor =
                                              avaiableColor[index];
                                          setState(() {});
                                        } else if (controller
                                            .explanationType[0].isSelected) {
                                          setState(() {
                                            canPaintPage = true;

                                            pageSelectedColor =
                                                avaiableColor[index];
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: avaiableColor[index],
                                          shape: BoxShape.circle,
                                        ),
                                        foregroundDecoration: BoxDecoration(
                                          border: controller
                                                  .explanationType[0].isSelected
                                              ? (pageSelectedColor ==
                                                      avaiableColor[index]
                                                  ? Border.all(
                                                      color: COLORS.whiteColor,
                                                      width: 3)
                                                  : null)
                                              : (boardSelectedColor ==
                                                      avaiableColor[index]
                                                  ? Border.all(
                                                      color: COLORS.whiteColor,
                                                      width: 3)
                                                  : null),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (isEditingPen)
                              RotatedBox(
                                quarterTurns: 2, // 270 degree
                                child: Slider(
                                  value:
                                      controller.explanationType[0].isSelected
                                          ? pageSelectedWidth
                                          : boardSelectedWidth,
                                  activeColor: COLORS.whiteColor,
                                  inactiveColor: COLORS.grayFont,
                                  min: 1,
                                  max: 20,
                                  onChanged: (value) {
                                    if (controller
                                        .explanationType[2].isSelected) {
                                      boardSelectedWidth = value;
                                    } else if (controller
                                        .explanationType[0].isSelected) {
                                      pageSelectedWidth = value;
                                    }
                                    setState(() {});
                                  },
                                ),
                              ),



                             */
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onPanStart: (details) {
                        controller.startDrawing('page', details);
                      },
                      onPanUpdate: (details) {
                        controller.updateDrawing('page', details);
                      },
                      onPanEnd: (_) {
                        controller.endDrawing(
                          'page',
                        );
                      },
                      child: CustomPaint(
                          painter: DrawingPainter(
                            drawingPoints: controller.pageDrawingPoints,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.pageImage,
                                ),
                              ),
                            ),
                          )),
                    ),
                    cameraWidget(),
                    GestureDetector(
                      onPanStart: (details) {
                        controller.startDrawing('board', details);
                      },
                      onPanUpdate: (details) {
                        controller.updateDrawing('board', details);
                      },
                      onPanEnd: (_) {
                        controller.endDrawing('board');
                      },
                      child: CustomPaint(
                        painter: DrawingPainter(
                          drawingPoints: controller.boardDrawingPoints,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 130.h,
                width: 414.w,
                color: COLORS.primaryColor,
                child: Visibility(
                  visible: !controller.exporting,
                  child: SizedBox(
                    height: 46.h,
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.explanationType.length,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                          right: 76.5.w, left: 76.5.w, top: 30.h, bottom: 34.h),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 18.w,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () async {
                            if (index == 1) {
                              await availableCameras().then((value) {
                                print(value);
                                controller.setCameraDescription(value);
                              });
                            }

                            controller.changeSelectedExplanationType(index);
                          },
                          child: Container(
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.symmetric(
                                horizontal: 21.w, vertical: 20.h),
                            decoration: BoxDecoration(
                                color: !controller
                                        .explanationType[index].isSelected
                                    ? COLORS.primaryColor
                                    : COLORS.secanderyColor,
                                border:
                                    Border.all(color: COLORS.secanderyColor),
                                borderRadius: BorderRadius.circular(
                                  23.r,
                                )),
                            child: Text(
                              controller.explanationType[index].title!.tr,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color:
                                    controller.explanationType[index].isSelected
                                        ? COLORS.whiteColor
                                        : COLORS.secanderyColor,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  replacement: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButton(
                        title: 'انهاء. وإضافة تدريبات للشرح',
                        onTap: () {},
                        backGround_Color: COLORS.secanderyColor,
                        width: double.infinity,
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
