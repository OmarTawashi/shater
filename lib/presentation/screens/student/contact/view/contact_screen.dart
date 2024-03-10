import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/presentation/screens/base/perfect_app_bar.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/contact/controller/contact_controller.dart';
import 'package:shater/presentation/screens/student/notification/view/notification_screen.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

import '../../../../../util/images.dart';
import '../../../base/custom_empty_view.dart';
import '../../../base/intike_tab_bar.dart';
import '../../../base/tap_section.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PerfectAppBar(),
        body: GetBuilder<ContactController>(
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
            ],
          ),
        ));
  }

  Widget selectable(ContactController controller) {
    switch (controller.selectContact) {
      case TabContact.contacts:
        return getContactWidget(controller);
      case TabContact.notifications:
        return const NotificationScreen();
      default:
        return getContactWidget(controller);
    }
  }

  Widget getContactWidget(ContactController contactController) {
    contactController.updateViewType(ViewType.success);
    return AnimatorContainer(
      viewType: contactController.viewType,
      isSliver: true,
      errorWidget: const CustomEmptyView(
        assetName: ICONS.contactWhite,
        primaryText: 'not_find_message',
        secanderyText: 'find_message_teacher',
      ),
      emptyParams: EmptyParams(
          text: 'empty Level', caption: '', image: ICONS.internalServerError),
      successWidget: SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: 5, (context, index) => ItemContact()),
      ),
      retry: () {},
    );
  }
}

class ItemContact extends StatelessWidget {
  const ItemContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Dimensions.paddingSize16, 0,
          Dimensions.paddingSize16, Dimensions.paddingSize10),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: COLORS.primaryColor),
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImageWidget(
              imageUrl: 'imageUrl ?? ' '',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: Dimensions.paddingSize12,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'محمد جمعه الطواشي',
                  color: COLORS.primaryColor,
                  fontSize: Dimensions.fontSize16,
                  fontWeight: FontWeight.bold,
                  maxLine: 1,
                ),
                SizedBox(
                  height: Dimensions.paddingSize10,
                ),
                CustomText(
                  text: 'محمد جمعه الطواش محمد جمعه الطواش محمد جمعه الطواشي',
                  color: Color.fromRGBO(149, 152, 154, 1),
                  fontSize: Dimensions.fontSize12,
                  fontWeight: FontWeight.w200,
                  maxLine: 2,
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'm' + '6',
                color: Colors.grey,
                fontSize: Dimensions.fontSize12,
                fontWeight: FontWeight.w400,
                maxLine: 1,
              ),
              SizedBox(
                height: Dimensions.paddingSize5,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: COLORS.secanderyColor, shape: BoxShape.circle),
                child: CustomText(
                  text: '2',
                  color: Colors.white,
                  fontSize: Dimensions.fontSize13,
                  fontWeight: FontWeight.w100,
                  maxLine: 1,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
