import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/presentation/screens/add%20child/controller/add_child_controller.dart';
import 'package:shater/presentation/screens/auth/resgister/controller/register_controller.dart';
import 'package:shater/presentation/screens/auth/sign%20in/widgets/item_childern.dart';
import 'package:shater/presentation/screens/base/body_select_photo.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/edit%20profile/controller/edit_profile_controller.dart';
import 'package:shater/presentation/screens/edit%20profile/take%20image/controller/take_image_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

import '../widget/grid_avatar_view.dart';

class TakeImageScreen extends StatelessWidget {
  const TakeImageScreen({super.key, required this.typeFrom});

  final int typeFrom;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (registerController) => Scaffold(
        backgroundColor: COLORS.primaryColor,
        extendBody: true,
        appBar: AppBar(
            backgroundColor: COLORS.primaryColor,
            leadingWidth: 200,
            leading: GestureDetector(
              onTap: () {
                if (typeFrom == 0) {
                  registerController.getFunUserType(
                      registerController.authController.userType);
                } else {
                  Get.back();
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    CustomText(
                      text: typeFrom == 0 ? 'skip' : 'back',
                      fontSize: Dimensions.fontSize16,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            )),
        bottomNavigationBar: GetBuilder<TakeImageController>(
            builder: (controller) => controller.imageFile != null
                ? GestureDetector(
                    onTap: () {
                      if (typeFrom == 0) {
                        registerController.getFunUserType(
                            registerController.authController.userType);
                      } else if(typeFrom == 1){
                        AddChildController addChildController =
                            Get.find<AddChildController>();
                        addChildController.setImageFile(controller.imageFile);
                        Get.back();
                      }else{
                        EditProfileController addChildController =
                        Get.find<EditProfileController>();
                        addChildController.setImageFile(controller.imageFile);
                        Get.back();
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(50, 0, 50, 50),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(color: COLORS.backGroundColor),
                      child: CustomText(
                        text: 'use',
                        fontSize: Dimensions.fontSize14,
                        textAlign: TextAlign.center,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : SizedBox()),
        body: GetBuilder<TakeImageController>(
          builder: (controller) => Column(
            children: [
              SizedBox(
                height: Dimensions.paddingSize25,
              ),
              CustomText(
                text: 'add_image_to_profile',
                fontSize: Dimensions.fontSize15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: Dimensions.paddingSize25 + 15,
              ),
              GestureDetector(
                onTap: () {
                  BaseMixin.showCustomBottomSheet(
                    BodySelectPhoto(
                      onTapSelectCamera: () {
                        controller.takeCameraImage();
                        Get.back();
                      },
                      onTapSelectGallery: () {
                        controller.takeGalleryImage();
                        Get.back();
                      },
                    ),
                  );
                },
                child: Container(
                  height: 180,
                  width: 180,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    // color: Colors.transparent,
                    // border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(alignment: Alignment.center, children: [
                    controller.imageFile == null
                        ? Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: COLORS.backGroundColor,
                                shape: BoxShape.circle),
                            child: Image.asset(
                              IMAGES.logoApp,
                              color: COLORS.primaryColor,
                            ),
                          )
                        : Container(
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
                          ),
                    CustomSvgPicture(
                      assetName: ICONS.cameraEdit,
                      width: 65,
                      height: 65,
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              CustomText(
                text: 'or_use_image_avatar',
                fontSize: Dimensions.fontSize15,
                color: COLORS.secanderyColor,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: Dimensions.paddingSize25 + 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemChildern(
                    onTap: () {
                      if (controller.imageFile == null) {
                        controller.setTypeAvatar('male');
                        typeFrom == 0
                            ? Get.toNamed(Routes.getGridViewAvatar())
                            : Get.to(GridViewAvatar(
                                typeFrom: typeFrom,
                              ));
                      } else {
                        controller.setImageFile(null);
                        controller.setTypeAvatar('male');
                        typeFrom == 0
                            ? Get.toNamed(Routes.getGridViewAvatar())
                            : Get.to(GridViewAvatar(
                          typeFrom: typeFrom,
                        ));
                      }
                    },
                    image: 'assets/male/10.png',
                    title: 'male',
                  ),
                  ItemChildern(
                    onTap: () {
                      if (controller.imageFile == null) {
                        controller.setTypeAvatar('female');
                        typeFrom == 0
                            ? Get.toNamed(Routes.getGridViewAvatar())
                            : Get.to(GridViewAvatar(
                          typeFrom: typeFrom,
                        ));
                      } else {
                        controller.setImageFile(null);
                        controller.setTypeAvatar('female');
                        typeFrom == 0
                            ? Get.toNamed(Routes.getGridViewAvatar())
                            : Get.to(GridViewAvatar(
                          typeFrom: typeFrom,
                        ));
                      }
                    },
                    image: 'assets/female/8.png',
                    title: 'female',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
