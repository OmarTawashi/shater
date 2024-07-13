import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/custom_intike_container.dart';
import 'package:shater/presentation/screens/base/image_user.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/classe/binding/classe_binding.dart';
import 'package:shater/presentation/screens/classe/view/classe_screen.dart';
import 'package:shater/presentation/screens/edit%20profile/controller/edit_profile_controller.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/custom_border_text.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/custom_edit_form.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/intike_ticket.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

import '../../auth/resgister/controller/register_controller.dart';
import '../../auth/sign up/controller/sign_up_controller.dart';
import '../../city/bindings/city_binding.dart';
import '../../city/view/city_screen.dart';
import '../../school/binding/school_bindings.dart';
import '../../school/view/school_screen.dart';
import '../take image/binding/take_image_binding.dart';
import '../take image/view/take_image_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      builder: (controller) {
        return Stack(
          children: [
            IgnorePointer(
              ignoring: controller.isLoading,
              child: Scaffold(
                extendBody: true,
                backgroundColor: COLORS.primaryColor,
                appBar: AppBar(
                  backgroundColor: COLORS.primaryColor,
                  leadingWidth: 120.w,
                  toolbarHeight: 65,
                  leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CustomIntikeContainer(
                      paddingHorizontal: Dimensions.paddingSize12,
                      child: CustomText(
                        text: 'cancel',
                        color: Colors.white,
                        fontSize: Dimensions.fontSize14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  actions: [
                    controller.isEnable() ? GestureDetector(
                      onTap: () {
                        log("Save");
                        controller.editProfile();
                      },
                      child: Container(
                        width: 120,
                        child: CustomIntikeContainer(
                          paddingHorizontal: Dimensions.paddingSize12,
                          child: CustomText(
                            text: 'save',
                            color: Colors.white,
                            fontSize: Dimensions.fontSize14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ) : CustomBorderText(
                      horizontalPadding: Dimensions.paddingSize25,
                      child: CustomText(
                        text: 'save',
                        color: controller.isEnable() ? Colors.white : COLORS.strokeColor,
                        fontSize: Dimensions.fontSize14,
                        fontWeight: FontWeight.bold,
                      ),
                      radius: 32,
                    ),
                  ],
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomCupertinoButton(
                    isLoading: controller.isLogoutLoading,
                    text: 'logout_account',
                    color: Colors.red.withOpacity(0.8),
                    onPressed: () {
                      controller.signOut();
                    },
                  ),
                ),
                body: GetBuilder<EditProfileController>(
                  builder: (controller) => CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSize16),
                          child: Column(
                            children: [
                              SizedBox(
                                height: Dimensions.paddingSize12,
                              ),
                              Stack(alignment: Alignment.center, children: [
                                ImageUser(
                                  imageUrl: controller.user?.image,
                                  image: controller.imageFile,
                                ),
                                /*(controller.user?.image != null ||
                                        controller.imageFile != null)
                                    ? SizedBox.shrink()
                                    : */GestureDetector(
                                  onTap: (){
                                    Get.put<SignUpController>(SignUpController());
                                    Get.put<RegisterController>(RegisterController());
                                    Get.to(
                                        TakeImageScreen(
                                          typeFrom: 2,
                                        ),
                                        binding: TakeImageBinding());
                                  },
                                      child: CustomSvgPicture(
                                          assetName: ICONS.cameraEdit,
                                          width: 65,
                                          height: 65,
                                        ),
                                    ),
                              ]),
                              SizedBox(
                                height: Dimensions.paddingSize16,
                              ),
                              CustomText(
                                text: controller.user?.email ?? '',
                                fontSize: Dimensions.fontSize16,
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize25,
                              ),
                              CustomEditForm(
                                textLeading: controller.user?.name ?? '',
                                isEditIcon: true,
                                isEnabled: true,
                                textEditingController: controller.nameController,
                                onChange: (value){
                                  controller.isEnable();
                                },
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize16,
                              ),
                              CustomEditForm(
                                textLeading: 'passworde',
                                textEditingController:
                                    TextEditingController(text: '********'),
                                tapTrailing: () {},
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize16,
                              ),
                              CustomEditForm(
                                textLeading: 'city',
                                hintText: 'choose'.tr + " " + 'city'.tr,
                                textEditingController: TextEditingController(
                                    text: controller.citySelected?.name),
                                tapTrailing: () {
                                  Get.to(
                                      cityScreen(
                                        typeFrom: 2,
                                      ),
                                      binding: CityBinding());
                                },
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize16,
                              ),
                              CustomEditForm(
                                textLeading: 'school',
                                hintText: 'choose'.tr + " " + 'school'.tr,
                                textEditingController: TextEditingController(
                                    text: controller.schoolSelected?.name),
                                tapTrailing: () {
                                  Get.to(
                                      SchoolScreen(
                                        typeFrom: 2,
                                      ),
                                      binding: SchoolBinding(2));
                                },
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize16,
                              ),
                              CustomEditForm(
                                textLeading: 'class',
                                textEditingController: TextEditingController(
                                    text: controller.classStudSelected?.title),
                                tapTrailing: () {
                                  Get.to(
                                      ClasseScreen(
                                        typeFrom: 2,
                                      ),
                                      binding: ClasseBinding(2));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                          clipBehavior: Clip.hardEdge,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(50)),
                          child: Divider(
                            color: COLORS.backGroundColor,
                            thickness: 5,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSize16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IntikeTicket(
                                assetName: ICONS.about,
                                text: 'about_me',
                                onTap: () {},
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize16,
                              ),
                              IntikeTicket(
                                assetName: ICONS.rate,
                                text: 'rate_me',
                                onTap: () {},
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize16,
                              ),
                              IntikeTicket(
                                assetName: ICONS.support,
                                text: 'contact_me',
                                onTap: () {},
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize16,
                              ),
                              IntikeTicket(
                                assetName: ICONS.callFriend,
                                text: 'call_friend',
                                onTap: () {},
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize16,
                              ),
                              IntikeTicket(
                                assetName: ICONS.privcy,
                                text: 'privcy_policy',
                                onTap: () {},
                              ),
                              SizedBox(
                                height: Dimensions.paddingSize20,
                              ),
                              GestureDetector(
                                onTap: (){
                                  BaseMixin.showDialogDeleteAccount(
                                      context:context ,
                                      textEditingController: controller.deleteAccountTextController,
                                      onConfirm: (){
                                        controller.deleteAccount();
                                        Get.back();
                                      },
                                  );
                                },
                                child: CustomText(
                                  text: 'delete_account'.tr,
                                  fontSize: Dimensions.fontSize14,
                                  color: Colors.white,
                                  maxLine: 1,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                          ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                          clipBehavior: Clip.hardEdge,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(50)),
                          child: Divider(
                            color: COLORS.backGroundColor,
                            thickness: 5,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 80.h,
                        ),
                      )
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
                filter: ColorFilter.mode(Colors.white24, BlendMode.color),
                child: Center(
                    child: CircularProgressIndicator(
                      color: COLORS.whiteColor,
                    )),
              ),
            )
                : SizedBox()
          ],
        );
      }
    );
  }
}
