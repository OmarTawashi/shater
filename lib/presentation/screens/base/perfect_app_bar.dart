import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/semester_type_widget.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';

import '../../../util/dimensions.dart';

class PerfectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PerfectAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) => AppBar(
        // pinned: true,
        backgroundColor: COLORS.primaryColor,
        primary: true,
        elevation: 0,
        titleSpacing: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: CustomText(
          text: controller.user?.name ?? '',
          color: Colors.white,
          fontSize: Dimensions.fontSize16 + 1,
          overFlow: TextOverflow.fade,
          maxLine: 1,
        ),
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.getProfileScreen());
            // print(controller.user);
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
        actions: [
          SemesterTypeWidget(semester: controller.level?.title ?? 'sdsd')
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}
