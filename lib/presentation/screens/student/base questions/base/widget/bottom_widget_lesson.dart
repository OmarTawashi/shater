import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/base/base_mixin.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
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
                BaseMixin.showBottomSheet(Container(
                  height: 600.h,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize10,
                      vertical: Dimensions.paddingSize10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              size: 23,
                              color: Colors.black,
                            ),
                          ),
                          Expanded(
                            child: CustomText(
                              text: '3\t' + 'commentting'.tr,
                              textAlign: TextAlign.center,
                              fontSize: Dimensions.fontSize16,
                              color: Color.fromRGBO(128, 127, 127, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.paddingSize20,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => ListTile(
                                horizontalTitleGap: Dimensions.paddingSize12,
                                minLeadingWidth: 0,
                                leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.amber,
                                ),
                                title: CustomText(
                                  text: 'اسماء عادل',
                                  fontSize: Dimensions.fontSize16,
                                  color: Color.fromRGBO(128, 127, 127, 1),
                                ),
                                subtitle: CustomText(
                                  text: 'شرح رائع بس الصوت منخفض شوي',
                                  fontSize: Dimensions.fontSize16,
                                  color: Color.fromRGBO(51, 51, 52, 1),
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                height: Dimensions.paddingSize20,
                              ),
                          itemCount: 5)
                    ],
                  ),
                ));
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
