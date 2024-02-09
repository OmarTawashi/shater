import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';
import 'package:shater/views/screens/base/intike_tab_bar.dart';
import 'package:shater/views/screens/base/perfect_app_bar.dart';
import 'package:shater/views/screens/base/svgpicture_custom.dart';
import 'package:shater/views/screens/base/text_custom.dart';
import 'package:shater/views/screens/teacher/controller/teacher_controller.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TeacherController>(
        builder: (controller) => CustomScrollView(
          slivers: [
            const PerfectAppBar(),
            IntikeTapBar(
                assetName: ICONS.teacherTop,
                secanderyChild: Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 16),
                    padding: const EdgeInsets.fromLTRB(0, 14, 16, 14),
                    decoration: const BoxDecoration(
                      color: COLORS.strokeColor,
                    ),
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final isSelected =
                              controller.selectedTapIndex == index;
                          return GestureDetector(
                            onTap: () {
                              controller.changeTapIndex(index);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSize25,
                                  vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.5,
                                      color: isSelected
                                          ? Colors.transparent
                                          : COLORS.primaryColor
                                              .withOpacity(0.4)),
                                  color: isSelected
                                      ? COLORS.primaryColor
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(32)),
                              child: const Center(
                                child: CustomText(
                                    text: 'all',
                                    color: Colors.white,
                                    fontSize: Dimensions.fontSize14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: Dimensions.paddingSize5,
                            ),
                        itemCount: 8),
                  ),
                )),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.h),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomSvgPicture(assetName: ICONS.teacherWhite),
                      SizedBox(
                        height: Dimensions.paddingSize16,
                      ),
                      CustomText(
                        text: 'soon',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSize16,
                      ),
                      SizedBox(
                        height: Dimensions.paddingSize16,
                      ),
                      CustomText(
                        text: 'find_account_teacher',
                        color: Color.fromRGBO(179, 238, 255, 1),
                        fontWeight: FontWeight.w400,
                        fontSize: Dimensions.fontSize16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
