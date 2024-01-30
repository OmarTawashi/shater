import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Shater'.tr,
              style: FontStyleConstant.hNLTBBold
                  .copyWith(fontSize: Dimensions.fontSize18, color: Colors.white),
            ),
          ),
          Text(
            'Version''\t' "1.0.0",
            style: FontStyleConstant.hNLTBBold
                .copyWith(fontSize: Dimensions.fontSize18, color: Colors.white),
          ),
          SizedBox(
            height: 80.h,
          )
        ],
      ),
    );
  }
}
