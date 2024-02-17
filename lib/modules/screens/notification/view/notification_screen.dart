import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shater/modules/screens/notification/widgets/leading_icon_notification.dart';
import 'package:shater/routes/app_routes.dart';

import '../../../../util/color.dart';
import '../../exercise subject/view/exercise_subject_screen.dart';
import '../widgets/item_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            (context, index) => ItemNotification(
                  onTap: () {
                    Get.toNamed(Routes.getNotificationDetails());
                  },
                ),
            childCount: 5));
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
          leading: IconTextCont(
            text: 'notifications',
          ),
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
