import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shater/core/controller/shared_prefrences.dart';
import 'package:shater/data/model/user.dart';
import 'package:shater/routes/app_routes.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? _user;
  @override
  void initState() {
    super.initState();
    _user = SharedPrefs.user;
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (_user == null) {
        Get.offAllNamed(Routes.getBaseLoginScreen());
      } else {
        Get.offAllNamed(Routes.getDashBoardScreen());
      }
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 2)).then((value) {
  //    Get.offAllNamed(Routes.getBaseLoginScreen());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width * 0.9;
    double height = size.height * 0.7;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Lottie.asset(
            'assets/animate/batreq.json',
            repeat: true,
            width: width,//0.9
            height: height,//0.7
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'shater'.tr,
              style: FontStyleConstant.hNLTBBold.copyWith(
                  fontSize: Dimensions.fontSize18, color: Colors.white),
            ),
          ),
          Text(
            "version".tr + '\t' "1.0.0",
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
