import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/cashed_network_image_widget.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.boxTitle,
    required this.backButtonTitle,
    this.withImage,
    this.appbarHight,
  });
  final String boxTitle;
  final String backButtonTitle;
  final bool? withImage;
  final double? appbarHight;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: appbarHight ?? 250.h,
      color: COLORS.primaryColor,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsetsDirectional.only(
                    top: 30.h,
                    start: 30.w,
                  ),
                  height: 46.h,
                  // width: 82.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Colors.white,
                      ),
                      Text(
                        backButtonTitle,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Visibility(
            visible: withImage ?? true,
            child: Container(
              height: 100.h,
              width: 100.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: 3,
                ),
                // borderRadius: BorderRadius.circular(40),
              ),
              child: CachedNetworkImageWidget(
                imageUrl: '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsetsDirectional.all(10),
            height: 45.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: COLORS.backGroundColor),
            child: Text(
              boxTitle,
              style: FontStyleConstant.hNLTBMedium.copyWith(
                color: Colors.white,
                fontSize: Dimensions.fontSize18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
