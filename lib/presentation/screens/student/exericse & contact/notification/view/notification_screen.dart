import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/animator_container.dart';
import 'package:shater/presentation/screens/base/custom_empty_view.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/notification/controller/notification_controller.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/notification/widgets/leading_icon_notification.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/images.dart';

import '../../../../../../util/color.dart';
import '../widgets/item_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) => AnimatorContainer(
        viewType: controller.viewType,
        isSliver: true,
        errorWidget: const CustomEmptyView(
          assetName: ICONS.contactWhite,
          primaryText: 'not_find_message',
          secanderyText: 'find_message_teacher',
        ),
        emptyParams: EmptyParams(
          text: 'empty Level',
          caption: '',
          image: ICONS.internalServerError,
        ),
        successWidget: SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ItemNotification(
                      notification: controller.notifications[index],
                      onTap: () {
                        Get.toNamed(Routes.getNotificationDetails());
                      },
                    ),
                childCount: controller.notifications.length)),
        retry: () {},
      ),
    );
  }
}

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          leadingWidth: 140,
          toolbarHeight: 130,
          backgroundColor: COLORS.primaryColor,
          automaticallyImplyLeading: false,
          excludeHeaderSemantics: true,
          centerTitle: true,
          title: LeadingIconNotification(
            radius: 45,
            height: 70,
            width: 70,
          ),
        ),
      ],
    ));
  }
}
