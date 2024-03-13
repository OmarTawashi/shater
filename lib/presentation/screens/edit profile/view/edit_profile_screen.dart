import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/custom_intike_container.dart';
import 'package:shater/presentation/screens/base/image_user.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/edit%20profile/controller/edit_profile_controller.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/custom_border_text.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/custom_edit_form.dart';
import 'package:shater/presentation/screens/edit%20profile/widgets/intike_ticket.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          CustomBorderText(
            horizontalPadding: Dimensions.paddingSize25,
            child: CustomText(
              text: 'save',
              color: COLORS.strokeColor,
              fontSize: Dimensions.fontSize14,
              fontWeight: FontWeight.bold,
            ),
            radius: 32,
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<EditProfileController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(16),
          child: CustomCupertinoButton(
            isLoading: controller.isLoading,
            text: 'logout_account',
            color: Colors.red.withOpacity(0.8),
            onPressed: () {
              controller.signOut();
            },
          ),
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
                        imageUrl: null,
                      ),
                      CustomSvgPicture(
                        assetName: ICONS.cameraEdit,
                        width: 65,
                        height: 65,
                      ),
                    ]),
                    SizedBox(
                      height: Dimensions.paddingSize16,
                    ),
                    CustomText(
                      text: 'omg.mohamed@gmail.com',
                      fontSize: Dimensions.fontSize16,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize25,
                    ),
                    CustomEditForm(
                      textLeading: 'name',
                      textEditingController:
                          TextEditingController(text: controller.user?.name),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize16,
                    ),
                    CustomEditForm(
                      textLeading: 'passworde',
                      textEditingController:
                          TextEditingController(text: '********'),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize16,
                    ),
                    CustomEditForm(
                      textLeading: 'city',
                      textEditingController: TextEditingController(
                          text: controller.user?.city?.name),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize16,
                    ),
                    CustomEditForm(
                      textLeading: 'school',
                      textEditingController: TextEditingController(
                          text: controller.user?.school?.name),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSize16,
                    ),
                    CustomEditForm(
                      textLeading: 'class',
                      textEditingController: TextEditingController(
                          text: controller.user?.classes?.title),
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
    );
  }
}
