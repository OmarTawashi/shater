import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/modules/screens/base/perfect_app_bar.dart';
import 'package:shater/modules/screens/contact/controller/contact_controller.dart';
import 'package:shater/modules/screens/notification/view/notification_screen.dart';

import '../../../../util/images.dart';
import '../../base/custom_empty_view.dart';
import '../../base/intike_tab_bar.dart';
import '../../base/tap_section.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<ContactController>(
      builder: (controller) => CustomScrollView(
        slivers: [
          const PerfectAppBar(),
          IntikeTapBar(
            assetName: ICONS.exerciseTop,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TapSection(
                  isSelected: (controller.selectContact == TabContact.contacts),
                  onTap: () {
                    controller.changeSection(TabContact.contacts);
                  },
                  text: TabContact.contacts.name.tr,
                ),
                TapSection(
                  isSelected:
                      (controller.selectContact == TabContact.notifications),
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
          selectable(controller.selectContact),
        ],
      ),
    ));
  }

  Widget selectable(TabContact tabContact) {
    switch (tabContact) {
      case TabContact.contacts:
        return const CustomEmptyView(
          assetName: ICONS.contactWhite,
          primaryText: 'not_find_message',
          secanderyText: 'find_message_teacher',
        );
      case TabContact.notifications:
        return const NotificationScreen();
    }
  }
}
