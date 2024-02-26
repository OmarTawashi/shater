import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_sliver_app_bar.dart';
import 'package:shater/presentation/screens/base/semester_type_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/dashBord/controller/dashboard_controller.dart';

import '../../../util/dimensions.dart';

class PerfectAppBar extends StatelessWidget {
  const PerfectAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) => CustomSliverAppBar(
        leadingWidth: 150.w,
        pinned: true,
        primary: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin:
                  EdgeInsets.symmetric(horizontal: Dimensions.paddingSize10.w),
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
            ),
            CustomText(
              text: controller.user?.name ?? '',
              color: Colors.white,
              fontSize: Dimensions.fontSize16 + 1,
              maxLine: 1,
            )
          ],
        ),
        actions: [SemesterTypeWidget(semester: 'season_one')],
      ),
    );
  }
}
