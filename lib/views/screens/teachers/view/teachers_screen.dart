import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/images.dart';
import 'package:shater/views/screens/base/section_header_delegate.dart';
import 'package:shater/views/screens/base/tap_section.dart';
import 'package:shater/views/screens/teachers/controller/teachers_controller.dart';

import '../../../../util/dimensions.dart';
import '../../base/perfect_app_bar.dart';
import '../../base/text_custom.dart';

class TeacherScreen extends StatelessWidget {
  const TeacherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TeacherController>(
        builder: (controller) => CustomScrollView(
          slivers: [
            const PerfectAppBar(
              assetName: ICONS.teachersTopBar,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SectionHeaderDelegate(
                height: 100,
                widget: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      border:
                          Border.all(color: COLORS.secanderyColor, width: 2.5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TapSection(
                        isSelected:
                            (controller.selectSection == TabSection.sectionOne),
                        onTap: () {
                          controller.changeSection(TabSection.sectionOne);
                        },
                        text: 'season_one'.tr,
                      ),
                      TapSection(
                        isSelected:
                            (controller.selectSection == TabSection.sectionTwo),
                        onTap: () {
                          controller.changeSection(TabSection.sectionTwo);
                        },
                        text: 'season_two'.tr,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 5,
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Image.asset(
                              ICONS.book,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: Dimensions.paddingSize16,
                          ),
                          Expanded(
                            child: ListTile(
                              minVerticalPadding: 16,
                              contentPadding: EdgeInsets.zero,
                              title: const CustomText(
                                text: 'رياضيات',
                                color: Colors.white,
                                fontSize: Dimensions.fontSize18,
                                fontWeight: FontWeight.bold,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomText(
                                    text: "110" + "\t" + 'كورس',
                                    color: Color.fromRGBO(198, 235, 245, 1),
                                    fontSize: Dimensions.fontSize12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    text: "110" + "\t" + 'تمارين',
                                    color: Color.fromRGBO(198, 235, 245, 1),
                                    fontSize: Dimensions.fontSize12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              trailing: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: COLORS.primaryColor),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      text: "2",
                                      color: Colors.white,
                                      textAlign: TextAlign.start,
                                      fontSize: Dimensions.fontSize12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    const SizedBox(
                                      width: Dimensions.paddingSize5,
                                    ),
                                    CustomText(
                                      text: 'teachers',
                                      color: Colors.white,
                                      textAlign: TextAlign.start,
                                      fontSize: Dimensions.fontSize10.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      width: Dimensions.paddingSize10,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: COLORS.primaryColor.withOpacity(0.15),
                        height: 16,
                        thickness: 1.5,
                        endIndent: 80.w,
                        indent: 8,
                      )
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
