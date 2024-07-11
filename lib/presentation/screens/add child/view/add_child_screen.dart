import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/add%20child/controller/add_child_controller.dart';
import 'package:shater/presentation/screens/add%20child/view/take_photo_screen.dart';
import 'package:shater/presentation/screens/auth/sign%20up/controller/sign_up_controller.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/custom_intike_container.dart';
import 'package:shater/presentation/screens/base/custom_text_form_field.dart';
import 'package:shater/presentation/screens/base/image_user.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/city/bindings/city_binding.dart';
import 'package:shater/presentation/screens/classe/binding/classe_binding.dart';
import 'package:shater/presentation/screens/edit%20profile/controller/edit_profile_controller.dart';
import 'package:shater/presentation/screens/edit%20profile/take%20image/binding/take_image_binding.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/custom_border_text.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/custom_edit_form.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/intike_ticket.dart';
import 'package:shater/presentation/screens/profile/controller/profile_controller.dart';
import 'package:shater/presentation/screens/school/binding/school_bindings.dart';
import 'package:shater/presentation/screens/school/view/school_screen.dart';
import 'package:shater/util/assets_manager.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

import '../../../../routes/app_routes.dart';
import '../../../../util/app_shared_data.dart';
import '../../../../util/font_style.dart';
import '../../auth/base login/controller/auth_controller.dart';
import '../../auth/resgister/controller/register_controller.dart';
import '../../city/view/city_screen.dart';
import '../../classe/view/classe_screen.dart';
import '../../edit profile/take image/view/take_image_screen.dart';

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find<ProfileController>();
    return DismissKeyboard(
      child: Scaffold(
        extendBody: true,
        backgroundColor: COLORS.secanderyColor,
        appBar: AppBar(
          backgroundColor: COLORS.secanderyColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: COLORS.primaryColor,
              size: 25.sp,
            ),
          ),
        ),
        body: GetBuilder<AddChildController>(builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                  width: double.infinity,
                ),
                CustomText(
                  text: 'add new student'.tr,
                  textAlign: TextAlign.center,
                  overFlow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontSize: Dimensions.fontSize22,
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () {
                    Get.put<SignUpController>(SignUpController());
                    Get.put<RegisterController>(RegisterController());
                    Get.to(
                        TakeImageScreen(
                          typeFrom: 1,
                        ),
                        binding: TakeImageBinding());
                  },
                  child: Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: COLORS.primaryColor,
                          width: 7.w,
                        )),
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(AppMedia.add_user_image),
                        ),
                      ),
                      child: controller.imageFile != null
                          ? Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: COLORS.backGroundColor,
                                  shape: BoxShape.circle),
                              child: Image.file(
                                controller.imageFile!,
                                fit: BoxFit.cover,
                                height: 180,
                                width: 180,
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: controller.fullNameController,
                        borderRadius: 50.r,
                        fillColor: Colors.white,
                        borderColor: Colors.transparent,
                        hintText: 'full name'.tr,
                        textColor: COLORS.primaryColor,
                        textSize: Dimensions.fontSize17,
                        cursorColor: COLORS.primaryColor,
                        onChanged: (value) {
                          controller.isValid();
                        },
                      ),
                      SizedBox(height: 15.h),
                      ChooseButton(
                        defaultValue: 'city'.tr,
                        onTap: () {
                          Get.to(
                              cityScreen(
                                typeFrom: 1,
                              ),
                              binding: CityBinding());
                        },
                        value: controller.citySelected == null
                            ? null
                            : controller.citySelected!.name,
                      ),
                      SizedBox(height: 15.h),
                      ChooseButton(
                        defaultValue: 'school'.tr,
                        value: controller.schoolSelected == null
                            ? null
                            : controller.schoolSelected!.name,
                        onTap: () {
                          Get.to(
                              SchoolScreen(
                                typeFrom: 1,
                              ),
                              binding: SchoolBinding(1));
                        },
                      ),
                      SizedBox(height: 15.h),
                      ChooseButton(
                        defaultValue: 'class'.tr,
                        value: controller.classStudSelected == null
                            ? null
                            : controller.classStudSelected!.title,
                        onTap: () {
                          AuthController authController =
                              Get.put(AuthController());
                          authController.setUserType = AuthType.student;
                          Get.to(
                              ClasseScreen(
                                typeFrom: 1,
                              ),
                              binding: ClasseBinding(1));
                        },
                      ),
                      SizedBox(height: 30.h),
                      AddChildButton(
                        title: "add".tr,
                        onTap: () {
                          log("controller.isValid() : ${controller.isValid()}");
                          log("add child");
                          controller.addChild();
                        },
                        isEnable: controller.isValid(),
                        isLoading: controller.isLoading,
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class ChooseButton extends StatelessWidget {
  ChooseButton({
    super.key,
    required this.defaultValue,
    this.value,
    this.isSelected = false,
    required this.onTap,
  });

  final String defaultValue;
  final String? value;
  final Function onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            value != null
                ? Text(
                    value!,
                    style: FontStyleConstant.hNLTRegular.copyWith(
                      color: COLORS.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize17,
                    ),
                  )
                : Text(
                    defaultValue,
                    style: FontStyleConstant.hNLTRegular.copyWith(
                      color: Color.fromRGBO(159, 191, 216, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.fontSize15,
                    ),
                  ),
            Icon(
              Icons.arrow_forward_ios,
              color: COLORS.primaryColor,
              size: 18.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class AddChildButton extends StatelessWidget {
  AddChildButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isEnable = false,
    this.isLoading = false,
  });

  final String title;
  final Function onTap;
  final bool isEnable;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnable) {
          onTap();
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: COLORS.primaryColor.withOpacity(isEnable ? 1 : 0.8),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: isLoading ? SizedBox(
          height: 20.h,
          width: 20.w,
          child: CircularProgressIndicator(color: Colors.white,),
        ): isEnable
            ? Text(
                title,
                style: FontStyleConstant.hNLTRegular.copyWith(
                  color: COLORS.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize20,
                ),
              )
            : Text(
                title,
                style: FontStyleConstant.hNLTRegular.copyWith(
                  color: COLORS.secanderyColor.withOpacity(0.8),
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize18,
                ),
              ),
      ),
    );
  }
}
