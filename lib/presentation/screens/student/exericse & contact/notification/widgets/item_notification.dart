import 'package:flutter/material.dart';
import 'package:shater/core/base/date_converter.dart';
import 'package:shater/data/model/notification_model.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/exericse%20&%20contact/notification/widgets/leading_icon_notification.dart';

import '../../../../../../util/color.dart';
import '../../../../../../util/dimensions.dart';

class ItemNotification extends StatelessWidget {
  final NotificationModel? notification;

  final Function()? onTap;
  const ItemNotification({
    super.key,
    this.notification,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            top: 8,
            right: Dimensions.paddingSize16,
            left: Dimensions.paddingSize16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          horizontalTitleGap: 6,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          onTap: onTap,
          leading: const LeadingIconNotification(
            height: 30,
            width: 30,
          ),
          title: Text(
            notification?.data?.title ?? '',
            style: TextStyle(
              fontSize: 16,
              color: COLORS.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            notification?.data?.message ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    text: DateConverter.formatTimestamp(
                        notification?.createdAt ?? ''),
                    fontSize: Dimensions.fontSize12,
                    color: Colors.grey,
                    maxLine: 1,
                  ),
                  SizedBox(
                    width: Dimensions.paddingSize5,
                  ),
                  notification?.readAt != null
                      ? Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: COLORS.secanderyColor),
                        )
                      : SizedBox()
                ],
              ),
              SizedBox(
                height: Dimensions.paddingSize8,
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 20,
                color: Colors.black45,
              ),
            ],
          ),
        ));
  }
}
/* Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: COLORS.secanderyColor, shape: BoxShape.circle),
              ),
              SizedBox(
                height: Dimensions.paddingSize10,
              ),*/