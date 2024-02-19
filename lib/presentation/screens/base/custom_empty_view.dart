import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shater/presentation/screens/base/svgpicture_custom.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/dimensions.dart';

class CustomEmptyView extends StatelessWidget {
  final String assetName;
  final String? primaryText;
  final String? secanderyText;
  const CustomEmptyView({
    super.key,
    required this.assetName,
    this.primaryText,
    this.secanderyText,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: EdgeInsets.only(bottom: 100.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgPicture(assetName: assetName),
              const SizedBox(
                height: Dimensions.paddingSize16,
              ),
              CustomText(
                text: primaryText ?? "", //'soon'
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.fontSize16,
              ),
              const SizedBox(
                height: Dimensions.paddingSize16,
              ),
              CustomText(
                text: secanderyText ?? "", //'find_account_teacher'
                color: Color.fromRGBO(179, 238, 255, 1),
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.fontSize16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
