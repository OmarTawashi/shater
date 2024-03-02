import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/auth/base%20login/view/base_login_screen.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/custom_intike_container.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/edit%20profile/view/edit_profile_screen.dart';
import 'package:shater/presentation/screens/level/controller/level_controller.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';
import 'package:shater/util/images.dart';

import '../../../../../util/color.dart';
import '../../../../../util/dimensions.dart';

class LevelScreen extends StatelessWidget {
  const LevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
          backgroundColor: COLORS.primaryColor,
          automaticallyImplyLeading: false,
          leadingWidth: 120,
          toolbarHeight: 65,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const CustomIntikeContainer(
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
            GestureDetector(
              onTap: Get.find<DashBoardController>().level != null
                  ? () {
                      Get.back();
                    }
                  : null,
              child: CustomBorderText(
                horizontalPadding: Dimensions.paddingSize25,
                child: CustomText(
                  text: 'save',
                  color: Get.find<DashBoardController>().level != null
                      ? Colors.white
                      : COLORS.strokeColor,
                  fontSize: Dimensions.fontSize14,
                  fontWeight: FontWeight.bold,
                ),
                radius: 32,
              ),
            ),
          ]),
      body: GetBuilder<LevelController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 90.0),
                child: CustomText(
                  text: "select_the_semester", //'soon'
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize16,
                ),
              ),
              AnimatorContainer(
                viewType: controller.viewType,
                isSliver: false,
                emptyParams: EmptyParams(
                  text: 'empty Level',
                  caption: '',
                  image: ICONS.internalServerError,
                ),
                successWidget: ListView.separated(
                  itemCount: controller.dataRegisterModels?.level?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final isSelected = controller.selectedIndex == index;
                    return ButtonBorderFillWidget(
                      onTap: () {
                        controller.changeIndex(index);
                        Get.find<DashBoardController>().changeLevel(
                            controller.dataRegisterModels?.level?[index]);
                      },
                      borderColor:
                          isSelected ? Colors.transparent : COLORS.strokeColor,
                      isShowIcon: false,
                      text: controller.dataRegisterModels?.level?[index].title,
                      backgroundColor: isSelected
                          ? COLORS.secanderyColor
                          : Colors.transparent,
                      textColor: isSelected
                          ? Colors.white
                          : const Color.fromRGBO(159, 191, 216, 1),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: Dimensions.paddingSize16,
                  ),
                ),
                retry: () {
                  controller.getLevel();
                },
              ),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
