import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/views/screens/contact/controller/contact_controller.dart';

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
        builder: (controller) => 
         CustomScrollView(
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
               const CustomEmptyView(
              assetName: ICONS.contactWhite,
              primaryText: 'not_find_message',
              secanderyText: 'find_message_teacher',
            ),
          ],
        ),
      )
    );
  }
}