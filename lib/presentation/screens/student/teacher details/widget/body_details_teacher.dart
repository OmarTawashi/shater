import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class BodyDetailsTeacher extends StatelessWidget {
  const BodyDetailsTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
            decoration: BoxDecoration(
                color: COLORS.backGroundColor,
                borderRadius: BorderRadius.circular(13)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'qualifications'.tr,
                  fontSize: Dimensions.fontSize18 + 2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: Dimensions.fontSize11,
                ),
                ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: Dimensions.paddingSize16,
                  ),
                  itemBuilder: (context, index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(106, 209, 0, 1),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.paddingSize8,
                      ),
                      CustomText(
                        text: 'لديه شهادة في التعليم',
                        fontSize: Dimensions.fontSize16,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
            decoration: BoxDecoration(
                color: COLORS.backGroundColor,
                borderRadius: BorderRadius.circular(13)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'brief'.tr,
                  fontSize: Dimensions.fontSize18 + 2,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: Dimensions.fontSize11,
                ),
                CustomText(
                  text:
                      'qualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualificationsqualifications',
                  fontSize: Dimensions.fontSize16,
                  color: Colors.white,
                  textHeight: 1.2,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              gradient: COLORS.gradientContainer,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: COLORS.backGroundColor),
              child: Row(
                children: [
                  Expanded(
                    child: CustomText(
                      text: 'فيديو تعريفي للمعلم',
                      fontSize: Dimensions.fontSize16,
                      color: Colors.white,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.play_circle_filled,
                    size: 22,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
