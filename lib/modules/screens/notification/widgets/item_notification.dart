import 'package:flutter/material.dart';
import 'package:shater/modules/screens/notification/widgets/leading_icon_notification.dart';

import '../../../../util/color.dart';
import '../../../../util/dimensions.dart';

class ItemNotification extends StatelessWidget {
  final Function()? onTap;
  const ItemNotification({super.key, this.onTap});

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
          leading: const LeadingIconNotification(),
          title: const Text(
            'Every year you good',
            style: TextStyle(
              fontSize: 16,
              color: COLORS.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: const Text(
            'Every year you good Every year you good',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_sharp,
            size: 20,
            color: Colors.black45,
          ),
        ));
  }
}
