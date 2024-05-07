import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/notification%20&%20contact/contact_me/view/contact_me_screen.dart';
import 'package:shater/presentation/screens/student/questions/base/widget/comment_widget.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class BottomWidgetLesson extends StatelessWidget {
  const BottomWidgetLesson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize16,
          vertical: Dimensions.paddingSize20),
      decoration: BoxDecoration(
        color: COLORS.secanderyColor,
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ItemBottomLesson(
              text: 'rated',
              onTap: () {},
              iconData: Icons.favorite_sharp,
            ),
            ItemBottomLesson(
              text: 'commented',
              iconData: Icons.comment_rounded,
              onTap: () {
                BaseMixin.showBottomSheet(CommentWidget());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemBottomLesson extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final IconData? iconData;
  const ItemBottomLesson({
    super.key,
    this.onTap,
    this.text,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          border: Border.all(color: Colors.white, width: 1.4),
        ),
        child: Row(
          children: [
            CustomText(
              text: text ?? '',
              fontSize: Dimensions.fontSize14,
              color: Colors.white,
              fontWeight: FontWeight.w400,
              maxLine: 1,
            ),
            SizedBox(
              width: Dimensions.paddingSize5,
            ),
            Icon(
              iconData,
              size: 25,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
