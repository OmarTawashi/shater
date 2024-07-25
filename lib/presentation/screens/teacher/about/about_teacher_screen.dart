
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';

import '../../../../util/app_shared_data.dart';
import '../../../../util/color.dart';
import '../../base/button_back.dart';
import '../../base/custom_text_form_field.dart';
import '../../base/text_custom.dart';

class AboutTeacherScreen extends StatefulWidget {
  const AboutTeacherScreen({super.key});

  @override
  State<AboutTeacherScreen> createState() => _AboutTeacherScreenState();
}

class _AboutTeacherScreenState extends State<AboutTeacherScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProfileController>().initAboutScreen();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<ProfileController>().disposeAboutScreen();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: GetBuilder<ProfileController>(builder: (controller) {
        return Scaffold(
          backgroundColor: COLORS.primaryColor,
          appBar: AppBar(
            backgroundColor: COLORS.primaryColor,
            leading: ButtonBack(),
          ),
          body: Stack(
            children: [
              IgnorePointer(
                ignoring: controller.isLoading || controller.isVideoLoading,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                        ),
                        CustomText(
                          text: 'سجل نبذة عنك'.tr,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: CustomText(
                            text: 'نبذة عن عملك'.tr,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          controller: controller.aboutEditingController,
                          hintText:
                              'استطيع تدريس النهج لاولادكم بشكل احترافي وممتاز فلدي خبرة تجاوزت 3سنوات في تدريس المراحل الأولى و ايصال المعلومة بشكل مشوق'
                                  .tr,
                          maxLines: 3,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.w),
                          hintStyle: TextStyle(
                              fontSize: 16.sp, color: COLORS.hintBlueColor),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            controller.update();
                          },
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: CustomText(
                            text: 'فيديو قصير عنك'.tr,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: CustomText(
                            text: '(اختياري)'.tr,
                            // fontWeight: FontWeight.bold,
                            color: COLORS.hintBlueColor,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.selectFileFromDevice();
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(
                                  color: COLORS.strokeColor,
                                  width: 2,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomText(
                                    text: controller.introVideoName != null
                                        ? controller.introVideoName!
                                        : 'سجل فيديو تعريفي عنك او عن عملك'.tr,
                                    color: COLORS.whiteColor,
                                    fontSize: 17.sp,
                                    overFlow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 5.h),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: COLORS.strokeColor,
                                        width: 2,
                                      )),
                                  child: Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              controller.isLoading || controller.isVideoLoading
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
              if ((!controller.isLoading) && controller.isAboutEnable()) {
                controller.editTeacherProfile();
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
              child: CustomText(
                text: 'next'.tr,
                fontWeight: FontWeight.bold,
                color: (!controller.isLoading) && controller.isAboutEnable()
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
