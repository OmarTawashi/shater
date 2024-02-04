import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/util/images.dart';
import 'package:shater/views/screens/base/custom_sliver_app_bar.dart';
import 'package:shater/views/screens/base/svgpicture_custom.dart';
import 'package:shater/views/screens/base/text_custom.dart';

import '../../../util/dimensions.dart';

class PerfectAppBar extends StatelessWidget {
  final String assetName;
  const PerfectAppBar({
    super.key,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(
      leadingWidth: 116.w,
      pinned: true,
      automaticallyImplyLeading: false,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin:
                EdgeInsets.symmetric(horizontal: Dimensions.paddingSize10.w),
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
          ),
          const CustomText(
            text: 'اسماء',
            color: Colors.white,
            fontSize: Dimensions.fontSize16 + 1,
          )
        ],
      ),
      centerTitle: true,
      title: Container(
          margin: EdgeInsets.fromLTRB(0, 55.h, 0, 0),
          child: CustomSvgPicture(assetName: assetName)),
      actions: [
        Container(
          margin:const EdgeInsets.symmetric(horizontal: Dimensions.paddingSize16),
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize16,
              vertical: Dimensions.paddingSize5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color.fromRGBO(72, 131, 196, 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //notification
              const CustomSvgPicture(assetName: ICONS.notification),
              const SizedBox(
                width: Dimensions.paddingSize5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,5),
                child: CustomText(
                  text: '2',
                  color: Colors.white,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.bold,
                  fontSize: Dimensions.fontSize14 + 2.sp,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
