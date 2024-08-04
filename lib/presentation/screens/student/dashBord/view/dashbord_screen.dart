import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/constant.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';
import 'package:shater/util/images.dart';
import '../controller/dashboard_controller.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) => Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          height: 65,
          color: Colors.transparent,
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: (value) {
              controller.changeIndex(value);
            },
            selectedItemColor: COLORS.primaryColor,
            unselectedItemColor: const Color.fromRGBO(190, 190, 190, 1),
            showUnselectedLabels: true,
            selectedLabelStyle: FontStyleConstant.hNLTBBold
                .copyWith(fontSize: Dimensions.fontSize12.sp),
            unselectedLabelStyle: FontStyleConstant.hNLTBBold
                .copyWith(fontSize: Dimensions.fontSize12.sp),
            type: BottomNavigationBarType.fixed,
            items: List.generate(
              5,
              (index) => navigationBarItem(
                  label: APPCONSTANT.labelTab[index].tr,
                  activeAssets: ICONS.activeTab[index],
                  isSelected: (controller.selectedIndex == index),
                  unActiveAssets: ICONS.unActiveTab[index]),
            ),
          ),
        ),
        body: IndexedStack(
          children: controller.screens,
          index: controller.selectedIndex,
        ),
      ),
    );
  }

  BottomNavigationBarItem navigationBarItem(
      {String? label,
      String? activeAssets,
      String? unActiveAssets,
      bool? isSelected}) {
    return BottomNavigationBarItem(
      label: label,
      icon: CustomSvgPicture(
        assetName: isSelected == true ? activeAssets! : unActiveAssets!,
        height: 22,
        width: 22,
      ),
    );
  }
}
