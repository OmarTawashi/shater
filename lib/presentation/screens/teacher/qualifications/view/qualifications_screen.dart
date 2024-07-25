
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/teacher/qualifications/view/widgets/qualifications_tab.dart';
import 'package:shater/presentation/screens/teacher/qualifications/view/widgets/qualifications_tab_veiw.dart';
import 'package:shater/presentation/screens/teacher/qualifications/view/widgets/remote_qualifications_widget.dart';
import 'package:shater/util/assets_manager.dart';

import '../../../../../util/app_shared_data.dart';
import '../../../../../util/color.dart';
import '../../../base/button_back.dart';
import '../../../base/text_custom.dart';
import '../controller/qualifications_controller.dart';

class QualificationsScreen extends StatelessWidget {
  const QualificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetBuilder<QualificationsController>(builder: (controller) {
        return Scaffold(
          backgroundColor: COLORS.primaryColor,
          appBar: AppBar(
            backgroundColor: COLORS.primaryColor,
            leading: ButtonBack(),
          ),
          body: Stack(
            children: [
              IgnorePointer(
                ignoring: controller.isLoading,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 20.h,
                        ),
                        CustomText(
                          text: 'qualifications'.tr,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22.sp,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50.h,
                          padding: EdgeInsets.all(3.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Row(
                            children: [
                              QualificationsTab(
                                title: 'Certificates'.tr,
                                id: 0,
                                selectedTabId: controller.selectedTabId,
                                onSelect: () {
                                  controller.changeSelectedTab(0);
                                },
                              ),
                              QualificationsTab(
                                title: 'Courses'.tr,
                                id: 1,
                                selectedTabId: controller.selectedTabId,
                                onSelect: () {
                                  controller.changeSelectedTab(1);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: controller.selectedTabId == 0
                                  ? "اكتب كل شهادة في حقل جديد"
                                  : "اكتب كل دورة في حقل جديد (اختياري)",
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 18.sp,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset(
                              AppMedia.add_icon,
                              height: 18.h,
                              width: 18.w,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        QualificationsTabView(
                          type: controller.selectedTabId == 0
                              ? QualificationsType.certificate
                              : QualificationsType.course,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              if (controller.selectedTabId == 0) {
                                controller.newQualification();
                              } else {
                                controller.newCourse();
                              }
                            },
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: COLORS.strokeColor,
                                  width: 1.8,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: SizedBox(
                                height: 10.h,
                                width: 10.w,
                                child: Image.asset(
                                  AppMedia.add_icon,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              controller.isLoading
                  ? Container(
                      height: Get.height,
                      width: Get.width,
                      child: BackdropFilter(
                        filter:
                            ColorFilter.mode(Colors.white24, BlendMode.color),
                        child: Center(
                            child: CircularProgressIndicator(
                          color: COLORS.whiteColor,
                        )),
                      ),
                    )
                  : SizedBox()
            ],
          ),
          bottomNavigationBar: GestureDetector(
            onTap: () async {
              if (!controller.isLoading) {
                if (controller.selectedTabId == 0) {
                  if (controller.isCertificatesEnable()) {
                    controller.uploadCertificateFile();
                  }
                } else {
                  if (controller.isCoursesEnable()) {
                    controller.uploadCourseFile();
                  }
                }
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              height: 55.h,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: COLORS.strokeColor,
              ),
              child: controller.isLoading
                  ? CustomText(
                      text: 'next'.tr,
                      fontWeight: FontWeight.bold,
                      color: controller.isLoading
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      fontSize: 18.sp,
                    )
                  : CustomText(
                      text: 'next'.tr,
                      fontWeight: FontWeight.bold,
                      color: controller.selectedTabId == 0
                          ? controller.isCertificatesEnable()
                              ? Colors.white
                              : Colors.white.withOpacity(0.5)
                          : controller.isCoursesEnable()
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                      fontSize: 18.sp,
                    ),
            ),
          ),
        );
      }),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  final Function onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      width: 45.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: COLORS.strokeColor,
          width: 1.8,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Icon(
          iconData,
          color: Colors.white,
          size: 30.sp,
        ),
      ),
    );
  }
}
