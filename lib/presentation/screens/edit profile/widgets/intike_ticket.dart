import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';

class IntikeTicket extends StatelessWidget {
  final Function()? onTap;
  final Function()? onOtherTextTap;
  final String? text;
  final String? assetName;
  final bool isTwoText;

  const IntikeTicket(
      {super.key,
      this.onTap,
      this.text,
      this.assetName,
      this.onOtherTextTap,
      this.isTwoText = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          padding: EdgeInsets.all(Dimensions.paddingSize12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: CustomSvgPicture(
            assetName: assetName ?? '',
          ),
        ),
        SizedBox(
          width: Dimensions.paddingSize16,
        ),
        isTwoText ? Row(
          children: [
            GestureDetector(
              onTap: onTap,
              child: CustomText(
                text: 'privcy'.tr,
                fontSize: Dimensions.fontSize14,
                color: Colors.white,
                maxLine: 1,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 10.w,),
            GestureDetector(
              onTap: onOtherTextTap,
              child: CustomText(
                text: 'and_policy'.tr,
                fontSize: Dimensions.fontSize14,
                color: Colors.white,
                maxLine: 1,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ) : GestureDetector(
          onTap: onTap,
          child: CustomText(
            text: text ?? '',
            fontSize: Dimensions.fontSize14,
            color: Colors.white,
            maxLine: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
