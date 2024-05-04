import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/section_header_delegate.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/teacher%20details/controller/teacher_details_controller.dart';
import 'package:shater/presentation/screens/student/teacher%20details/widget/body_details_teacher.dart';
import 'package:shater/presentation/screens/student/teacher%20details/widget/body_subscrip_teacher.dart';
import 'package:shater/presentation/screens/student/teacher%20details/widget/bottom_subscrip_teacher.dart';
import 'package:shater/presentation/screens/student/teacher%20details/widget/tap_teacher_widget.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class TeacherDetailsScreen extends StatelessWidget {
  const TeacherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 86, 153, 1),
      bottomNavigationBar: GetBuilder<TeacherDetailsController>(
          builder: (controller) => getBottomWidget(controller)),
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: COLORS.backGroundColor,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.settings,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<TeacherDetailsController>(
        builder: (controller) => CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SectionHeaderDelegate(
                  height: 255,
                  widget: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(8, 202, 254, 1.0),
                                  Color.fromRGBO(229, 89, 241, 1.0),
                                ],
                                stops: [0.0, 1.0],
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundColor: Colors.white,
                                  child: ClipOval(
                                    child: SizedBox(
                                      width: 90.0,
                                      height: 90.0,
                                      child: CachedNetworkImageWidget(
                                        imageUrl: controller.teacherController
                                                ?.teacherSelected?.image ??
                                            '',
                                        fit: BoxFit
                                            .cover, // Fill the container completely
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.paddingSize12,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: CustomSvgPicture(
                                assetName: ICONS.starRatingFull),
                          ),
                          SizedBox(
                            width: Dimensions.paddingSize8,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSize12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: COLORS.secanderyColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: CustomText(
                              text: controller.teacherController
                                      ?.teacherSelected?.teacherRate
                                      .toString() ??
                                  '',
                              color: Colors.white,
                              fontSize: Dimensions.fontSize16,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.paddingSize20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Get.toNamed(Routes.getTeacherDetailsScreen());
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSize16),
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.paddingSize16,
                                    vertical: Dimensions.paddingSize12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(8, 202, 254, 1.0),
                                      Color.fromRGBO(229, 89, 241, 1.0),
                                    ],
                                    stops: [0.0, 1.0],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                  ),
                                ),
                                child: CustomText(
                                  text: controller.teacherController
                                          ?.teacherSelected?.name ??
                                      '',
                                  color: Colors.white,
                                  fontSize: Dimensions.fontSize18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.paddingSize16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TapTeacherWidget(
                                text: 'to_teacher'.tr,
                                isSelected: controller.teacherTapSelected ==
                                    TeacherDetailsTap.Teacher,
                                onTap: () {
                                  controller.changeTeacherTap(
                                      TeacherDetailsTap.Teacher);
                                },
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.paddingSize16,
                            ),
                            Expanded(
                                child: TapTeacherWidget(
                              text: 'to_subscription'.tr,
                              isSelected: controller.teacherTapSelected ==
                                  TeacherDetailsTap.Subscription,
                              onTap: () {
                                controller.changeTeacherTap(
                                    TeacherDetailsTap.Subscription);
                              },
                            )),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            getBodyWidget(controller),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100.h,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getBodyWidget(TeacherDetailsController controller) {
    switch (controller.teacherTapSelected) {
      case TeacherDetailsTap.Teacher:
        return BodyDetailsTeacher();
      case TeacherDetailsTap.Subscription:
        return BodySubScripTeacher();

      default:
        return SliverToBoxAdapter();
    }
  }

  Widget getBottomWidget(TeacherDetailsController controller) {
    switch (controller.teacherTapSelected) {
      case TeacherDetailsTap.Teacher:
        return SizedBox();
      case TeacherDetailsTap.Subscription:
        return BottomSubScripTeacherWidget();

      default:
        return SizedBox();
    }
  }
}
