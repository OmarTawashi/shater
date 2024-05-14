import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/core/extenstion/lesson_extention.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/presentation/screens/student/questions/base/widget/comment_widget.dart';
import 'package:shater/presentation/screens/student/questions/lesson/controller/lesson_controller.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class BottomWidgetLesson extends StatelessWidget {
  const BottomWidgetLesson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonController>(
      builder: (controller) => getBottomWidget(controller.route),
    );
  }

  Widget getBottomWidget(route) {
    switch (route) {
      case RoutesName.pageSubjectScreen:
        return SizedBox();
      case RoutesName.subcriptionTeacherDetailsScreen:
        return BottomTeacherWidget();
      default:
        return SizedBox();
    }
  }
}

class BottomTeacherWidget extends StatelessWidget {
  const BottomTeacherWidget({
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
              onTap: () {
                BaseMixin.showBottomSheet(RatingLesson());
              },
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

class RatingLesson extends StatelessWidget {
  const RatingLesson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonController>(
      builder: (controller) => Container(
        padding: EdgeInsets.only(
            top: Dimensions.paddingSize10,
            left: Dimensions.paddingSize16,
            right: Dimensions.paddingSize16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: COLORS.whiteColor,
                      grade: 80,
                      weight: 50,
                      size: 28,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: controller.ratingVideo ?? 0.0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  glow: false,
                  wrapAlignment: WrapAlignment.spaceAround,
                  itemCount: 5,
                  itemSize: 45,
                  unratedColor: Colors.grey.withOpacity(0.28), // Empty color
                  itemPadding: EdgeInsets.symmetric(horizontal: 12),
                  itemBuilder: (context, _) => Icon(
                    Icons
                        .star_rounded, // You can replace this with your custom star icon
                    color: Color.fromRGBO(93, 199, 249, 1), // Filled color
                  ),
                  onRatingUpdate: (rating) {
                    controller.setRate(rating);
                  },
                  updateOnDrag: true,
                  ignoreGestures: false,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: COLORS.secanderyColor,
                      borderRadius: BorderRadius.circular(32)),
                  padding: EdgeInsets.symmetric(horizontal: 60.w),
                  child: CustomCupertinoButton(
                    color: COLORS.secanderyColor,
                    isLoading: controller.isLoadingMessage ?? false,
                    onPressed: () {
                      controller.sendRateVideo();
                    },
                    text: 'rate_teacher'.tr,
                  ),
                )
              ],
            ),
            SizedBox(
              height: Dimensions.paddingSize25,
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
