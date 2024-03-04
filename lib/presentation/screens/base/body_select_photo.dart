import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

import '../../../util/font_style.dart';

class BodySelectPhoto extends StatelessWidget {
  final Function()? onTapSelectCamera;
  final Function()? onTapSelectGallery;
  const BodySelectPhoto(
      {super.key, this.onTapSelectCamera, this.onTapSelectGallery});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: Dimensions.paddingSize12,
          ),
          Text(
            'select_photo'.tr,
            style: FontStyleConstant.hNLTBMedium.copyWith(
                fontSize: Dimensions.fontSize16.sp, color: COLORS.primaryColor),
          ),
          const SizedBox(
            height: Dimensions.paddingSize20,
          ),
          OutlinedButton(
            onPressed: onTapSelectCamera,
            child: Text(
              'select_photo_to_camera'.tr,
              style: FontStyleConstant.hNLTBMedium
                  .copyWith(color: COLORS.whiteColor),
            ),
            style: OutlinedButton.styleFrom(
                backgroundColor: COLORS.primaryColor,
                minimumSize: Size(double.infinity, 48),
                padding: const EdgeInsets.all(Dimensions.paddingSize16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius10))),
          ),
          const SizedBox(
            height: Dimensions.fontSize16,
          ),
          OutlinedButton(
            onPressed: onTapSelectGallery,
            child: Text(
              'select_photo_to_gallery'.tr,
              style: FontStyleConstant.hNLTBMedium
                  .copyWith(color: COLORS.whiteColor),
            ),
            style: OutlinedButton.styleFrom(
                backgroundColor: COLORS.primaryColor,
                minimumSize: Size(double.infinity, 48),
                padding: const EdgeInsets.all(Dimensions.paddingSize16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius10))),
          ),
          SizedBox(
            height: 25.sp,
          )
        ],
      ),
    );
  }
}
