import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/dashBord/controller/dashboard_controller.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/contact/view/contact_screen.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/controller/notification_contact_controller.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/notification/view/notification_screen.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/images.dart';

class NotificationContactScreen extends StatelessWidget {
  const NotificationContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NotifyAppBar(),
        body: GetBuilder<NotificationContactController>(
          builder: (controller) => CustomScrollView(
            slivers: [
              IntikeTapBar(
                assetName: ICONS.contactTop,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TapSection(
                      isSelected:
                          (controller.selectContact == TabContact.contacts),
                      onTap: () {
                        controller.changeSection(TabContact.contacts);
                      },
                      text: TabContact.contacts.name.tr,
                    ),
                    TapSection(
                      isSelected: (controller.selectContact ==
                          TabContact.notifications),
                      onTap: () {
                        controller.changeSection(TabContact.notifications);
                      },
                      text: TabContact.notifications.name.tr,
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 10,
              )),
              selectable(controller),
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 100.h,
              )),
            ],
          ),
        ));
  }

  Widget selectable(NotificationContactController controller) {
    switch (controller.selectContact) {
      case TabContact.contacts:
        return getContactWidget();
      case TabContact.notifications:
        return getNotificationWidget();
      default:
        return getContactWidget();
    }
  }

  Widget getContactWidget() {
    return ContactScreen();
  }

  Widget getNotificationWidget() {
    return NotificationScreen();
  }
}

class NotifyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotifyAppBar({
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
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.getContactMeScreen());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize16),
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSize16,
                  vertical: Dimensions.paddingSize8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromRGBO(72, 131, 196, 1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: "contact_me_sup",
                    color: Colors.white,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.fontSize12,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}
