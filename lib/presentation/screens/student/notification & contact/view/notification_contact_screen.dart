import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/intike_tab_bar.dart';
import 'package:shater/presentation/screens/base/perfect_app_bar.dart';
import 'package:shater/presentation/screens/base/tap_section.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/contact/view/contact_screen.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/controller/notification_contact_controller.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/notification/view/notification_screen.dart';
import 'package:shater/util/images.dart';

class NotificationContactScreen extends StatelessWidget {
  const NotificationContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PerfectAppBar(),
        body: GetBuilder<NotificationContactController>(
          builder: (controller) => CustomScrollView(
            slivers: [
              IntikeTapBar(
                assetName: ICONS.exerciseTop,
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
