import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/custom_sliver_app_bar.dart';
import 'package:shater/presentation/screens/base/semester_type_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';

import '../../../util/dimensions.dart';

class PerfectAppBar extends StatelessWidget {
  const PerfectAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) => CustomSliverAppBar(
        leadingWidth: 200.w,
        pinned: true,
        primary: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Get.toNamed(Routes.getProfileScreen());
                print(controller.user);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: CircleAvatar(
                    child: CachedNetworkImageWidget(
                      imageUrl: controller.user?.image ?? '',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
        actions: [SemesterTypeWidget(semester: controller.level?.title)],
      ),
    );
  }
}
