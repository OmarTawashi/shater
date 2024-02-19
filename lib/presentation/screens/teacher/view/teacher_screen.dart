import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/perfect_app_bar.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/teacher/controller/teacher_controller.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

import '../../base/custom_empty_view.dart';

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
            const CustomEmptyView(
              assetName: ICONS.teacherWhite,
              primaryText: 'soon',
              secanderyText: 'find_account_teacher',
            ),
          ],
        ),
      ),
    );
  }
}

